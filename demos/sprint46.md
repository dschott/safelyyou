# DEMO (Sprint 46)

## Transcoding

- kill transcoding-watcher

- guardian logs          [ videos uploading / jax ]
- sky logs               [ transcoding request sent ]
- browser                [ inbound - lambda - outbound ]
- sqs inbound message    [ headers - outputQueueUrl ]
- sqs outbound message   [ headers copied ]
- transcode-watcher logs [ writing to mysql ]
- datagrip query         [ processed records written ]
- dev discover site      [ facilties / videos ]

### cmd

- transcoding
- transcoding-watcher

### pkg

- file [ s3 local in mem etc ]
- logging [ cli / console output for tests ]

### Integration tests

- Makefile test-integration
- golang-dev image
- transcoding/lambda
- build tags=integration
- pkg/compose

chaska heights
