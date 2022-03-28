# DEMO (Sprint 42)

## Video1

```json
{
  "media": {
    "inputs": [ { "url": "s3://sy-integration-testing/static/g2/transcoding-service/video1/input.mp4" } ],
    "outputs": [
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out1/htmlfriendly.mp4", "format": "HTML_FRIENDLY" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out1/htmlfriendly", "format": "HTML_FRIENDLY_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out1/protected.mp4", "format": "PROTECTED" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out1/htmlfriendly", "format": "PROTECTED_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out1/thumbnail.jpg", "format": "THUMBNAIL" }
    ]
  }
}
```

## Video2

```json
{
  "media": {
    "inputs": [ { "url": "s3://sy-integration-testing/static/g2/transcoding-service/video2/input.mp4" } ],
    "outputs": [
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out2/htmlfriendly.mp4", "format": "HTML_FRIENDLY" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out2/htmlfriendly", "format": "HTML_FRIENDLY_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out2/protected.mp4", "format": "PROTECTED" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out2/htmlfriendly", "format": "PROTECTED_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out2/thumbnail.jpg", "format": "THUMBNAIL" }
    ]
  }
}
```

## Bad

```json
{
  "media": {
    "inputs": [ { "url": "s3://sy-integration-testing/NOTFOUND/input.mp4" } ],
    "outputs": [
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out3/htmlfriendly.mp4", "format": "HTML_FRIENDLY" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out3/htmlfriendly", "format": "HTML_FRIENDLY_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out3/protected.mp4", "format": "PROTECTED" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out3/htmlfriendly", "format": "PROTECTED_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out3/thumbnail.jpg", "format": "THUMBNAIL" }
    ]
  }
}
```

## Flow

```text
## Current ##

GUARDIAN --geturl--> SKY
GUARDIAN --upload--> S3
GUARDIAN --notify--> SKY
GUARDIAN --transcode--
GUARDIAN --upload--> S3
GUARDIAN --notify--> SKY

## Target ##

GUARDIAN --geturl--> SKY
GUARDIAN --upload--> S3
GUARDIAN --notify--> SKY --send--> SQS --receive--> LAMBDA --send--> SQS --receive--> SKY

## With SNS ##

GUARDIAN --notify--> SKY --send--> SNS --send--> SQS --receive--> LAMBDA --send--> SNS --send--> SQS --receive--> SKY

## Next ##

GAS replace SKY
```

## Processing

- Why SNS + SQS
  - SNS Fanout ... Many consumers
  - SQS fine grain controls (e.g. ttl, deadlettering, retries per consumer)
  - Lambda uses a queue ...but... offers limited control (2 retries, no deadlettering)
- Sync vs Async Lambda processing
  - Lambda destinations only work for async processing
  - SQS publishes to Lambda synchronously
  - Therefore Lambda function must write to SQS itself
- Lambda Resources
  - Memory utilization tied to CPU allocation (balance memory/cpu requires testing)
  - Possibly be cheaper if using ARM (limited test didn't seem so for ffmpeg)
  - If possible use batching from SQS (reduces resources and cost at high volume)
  - Pricing dirt cheap (1M transcoding request should be 10s of dollars per month)

## Asyncronous Invoke

```sh
aws lambda invoke \
--function-name dev1-transcoding \
--invocation-type Event \
--payload $(echo '{
  "media": {
    "inputs": [{"url": "s3://sy-integration-testing/static/g2/transcoding-service/input.mp4"}],
    "outputs": [
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out/htmlfriendly.mp4", "format": "HTML_FRIENDLY" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out/htmlfriendly", "format": "HTML_FRIENDLY_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out/protected.mp4", "format": "PROTECTED" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out/htmlfriendly", "format": "PROTECTED_HLS" },
      { "url": "s3://sy-integration-testing/static/g2/transcoding-service/out/thumbnail.jpg", "format": "THUMBNAIL" }
    ]
  }
}' | base64) response.json
```

## G2 Codebase

- Its a mono repo
- gRPC First
  - Doesn't meant all grpc services (for now)
  - Robust ecosystem
  - Mature/supported Golang tooling
  - Codegen works
    - [proto](../g2/proto/transcoding/v1/service.proto)
    - [proto](../g2/internal/pb/transcoding/v1/service_grpc.pb.go)
  - REST on top of gRPC service (proto annotations)
  - Lambda wraps gRPC service
    - [proto](../g2/cmd/transcoding-service/lambda/lambda.go)
  - Single implementation for middleware (auth, tls, etc)
- Resource-first development (Create, Get, List verbs etc)
  - [example](../g2/proto/transcoding/v1/service.proto)
- Testing
  - Unit test
  - Integration tests with Compose (for now)
  - [example](../g2/cmd/transcoding-service/lambda/lambda_test.go)
- Kit components
  - [File Storage](../g2/internal/file/store.go)
  - [Media](../g2/internal/media/encode.go)
  - [Compose](../g2/internal/media/encode.go)
- Using aws-sdk-go-v2 (Context aware)
