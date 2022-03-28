# Stream Handling

- RTSP in
- Decode
- Encode
- DVR
- Frame pub

## Requirements

Requirements for:
- Stream Processing (video frames)
  - Redis Pub/Sub
- Reliable Messaging (events)
  - Redis Streams?
  - Kakfa
-

Redis Pub/Sub
- Fire and Forget (at most once delivery)
- Consumers always block on read
- Fan-out

Redis Streams
- At-most-once or At-least-once
- Reciever must explicitly ack messages
- Consumers can block or not
- Fan-out/filtering

Redis is not backed by disk
- Single intstance is not reliabele

https://www.youtube.com/watch?v=t1U7ulz1_Dg&t=4767s


## Questions

- Redis must be highly available?


Realtime Streaming Video Frames

https://redis.com/ebook/redis-in-action/
