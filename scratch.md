
One of the challenges we need to overcome is how to efficiently deliver video frames across process as a near-realtime stream.

For example, a process will ingestion process that decodes video will need to publish video frames

Two messaging usecase:

I apologize for the late update.

Agenda for tomorrow's meeting is to establish some baseline technical requirements and considerations for Guardian video stream ingestion. This should cover DVR capabilities and video frame publishing for AI. I'll briefly cover how we can integrate with the Legacy Guardian but I'd like to focus on what the future architecture for handling realtime video data would look like. I am hoping to leverage Peter's experience here.

One complexity I'd like to work through is how video frames can be efficiently published cross-process to multiple consumers, where each consumer may "subscribe" at a different frame rate. e.g. ai may require 0.5 fps and motion detection may require 1 fps.

Additionally, by the end of this week, I'd like to identify the best candidate technology for handling pub/sub of video frames cross-process. At the moment, Redis Streams (or possibly just Redis PubSub) seems to be a great candidate. Other candidates may be Spark or Hazelcast, however, I want to avoid over-complicating the architecture. So any feedback on this decision would be helpful.


of video frames  one technology that I think may work well in this space is Redis Streams (although Redis Pub/Sub may be sufficient).

For each incoming stream it seems we have two needs:

1. Decoded incoming video
1. Efficiently deliver decoded video frames to consumers (AI) across process
1. Encode video to a standard format and store on disk

DVR:

- Encode to standard video format (resolution, fps, etc)
- Video expiration enforcement

Video Frame Publishing:
-
- Integration with Legacy Guardian (via Redis)


should cover I think we can establish an initial design proposal that we can prototype in the next sprint.
I'd like to use tomorrow's meeting to establish a reasonable technical direction for initial prototype.

Rough agenda for tomorrows meeting:

1. Stream decoding
1. Frame publishing
1. Video storage
1.

I have two concerns I'd like to tackle tomorrow:

1: Realtime stream processing
2: Reliable event messaging


Realtime non-durable streaming:

Reliable message processing:
- AI scores
- Event
