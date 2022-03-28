# DEMO (Sprint 43)

## Safety Check Overview

- Schedules stored in Sky
- Safety Check toggle stored in Sky
- Guardian receives schedule updates from Sky (every 60s)
- Schedules periodically evaluated (every 10s)
- Schedule format: list of explicit times for checks
- Duration for alerts is 60s
- Escalation occurs if:
  - 60s video available
  - *And* Current time equal to a scheduled time
  - *Or* Current time falls within 60s period after a scheduled time

### Safety Check Example Schedule

```SQL
INSERT sy_safety_check_schedule(schedule, sensor_id)
VALUES ('00:00:00', 48),
    ('00:05:00', 48),
    ('00:10:00', 48),
    ('00:15:00', 48),
    ('00:20:00', 48),
    ...
```

### Safety Check Configuration

[discover ui](http://tenant4.discoverui.safely-you.local:4201/facilities/1)

### Safety Check Guardian Logs

```sh
tail -f -n 1000 .docker/guardian/logs/guardian/safely_you.log | grep 'Safety check'
```

## Escalation / Transcoding Flow

```text
GUARDIAN --geturl--> SKY
GUARDIAN --upload--> S3
GUARDIAN --notify--> SKY --send--> SQS --receive--> LAMBDA --send--> SQS --receive--> SKY
```

- Guardian
  - Determine video ready for upload (AI, Safety Check, Sky Request)
  - Get raw video url from Sky
  - Upload to S3
  - Notify Sky upload complete
- Cloud
  - Sky sends transcode request via SQS
  - Transcoder receives transcode request from SQS
  - Transcoder writes transcoded video to S3 (per request)
  - Transcoder sends transcode response via S3
  - Sky Celery task receives transcode response via SQS
  - Sky Celery task records video metadata

### Sky Celery task (Check Transcoded Videos)

- Celery scheduled task (every 5s)
- Periodically processes transcoded videos until queue empty
- Max delay - 5s
- Reads from `transcoding-outbound` SQS queue
- Writes video metadata to Sky database

### Guardian Escalation Logs

```sh
tail -f -n 1000 .docker/guardian/logs/guardian/safely_you.log
```

### Sky Logs

```sh
dc logs -f sky-local | grep -v 'SELECT ' | grep -v 'INSERT INTO' | grep -v 'UPDATE ' | grep -n5 'transcode'
```

### Sky Celery Task Logs

Periodic Polling:

```sh
dc logs -f celery-local
```

Processing:

```sh
dc logs -f celery-local | grep 'Processing message'
```

### Example Transcoder Request

```json
{
    "reference_id": "582943",
    "media": {
        "inputs": [ { "url": "s3://sy-webapp-stag-tenant4/media/videos/2022/03/15/C4:CC:CC:CC:CC:CC/014207.045570.mp4" } ],
        "outputs": [
            {
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY.mp4",
                "format": "HTML_FRIENDLY"
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY",
                "format": "HTML_FRIENDLY_HLS"
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED.mp4",
                "format": "PROTECTED"
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED",
                "format": "PROTECTED_HLS"
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/thumbnail/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.jpg",
                "format": "THUMBNAIL"
            }
        ]
    }
}
```

### Example Transcoder Response

```json
{
    "reference_id": "582943",
    "media": {
        "inputs": [ { "url": "s3://sy-webapp-stag-tenant4/media/videos/2022/03/15/C4:CC:CC:CC:CC:CC/014207.045570.mp4" } ],
        "outputs": [
            {
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY.mp4",
                "format": "HTML_FRIENDLY",
                "duration": 60
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY",
                "format": "HTML_FRIENDLY_HLS",
                "duration": 60,
                "segments": [
                    {
                        "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY/seg000.ts",
                        "startTime": 1.8,
                        "duration": 10
                    }, {
                        "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.HTML_FRIENDLY/seg001.ts",
                        "startTime": 11.8,
                        "duration": 10
                    },
                    ...
                ]
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED.mp4",
                "format": "PROTECTED",
                "duration": 60
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED",
                "format": "PROTECTED_HLS",
                "duration": 60,
                "segments": [
                    {
                        "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED/seg000.ts",
                        "startTime": 1.8,
                        "duration": 10
                    },{
                        "url": "s3://sy-webapp-stag-tenant4/media/processed/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.PROTECTED/seg001.ts",
                        "startTime": 11.8,
                        "duration": 10
                    },...
                ]
            },{
                "url": "s3://sy-webapp-stag-tenant4/media/thumbnail/074201/2022/03/15/C4:CC:CC:CC:CC:CC/582943.jpg",
                "format": "THUMBNAIL",
                "duration": 0.04
            }
        ]
    }
}
```

## Verify Outputs

Sky Database:

```SQL
select v.entry_ptr_id, v.file, d.start, ss.identifier, sdp.details, sdp.file
from sy_videos v
join sy_data d on v.entry_ptr_id = d.id
left join sy_data_processed sdp on v.entry_ptr_id = sdp.entry_id
join sy_sensors ss on d.sensor_id = ss.id
where v.entry_ptr_id = ##ID##;
```

S3 Raw File:

```sh
aws s3 ls s3://sy-webapp-stag-tenant4/media/##RAW URL##
```

S3 Processed Files:

```sh
aws s3 ls s3://sy-webapp-stag-tenant4/media/##PROCESSED URL##
```
