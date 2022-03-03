# PLANNING

https://medium.com/codex/real-time-video-streaming-with-kafka-8b4014c06b24
https://github.com/pborgesEdgeX/Video-RTSP-Streaming-

https://megh.com/implementing-a-cpu-based-real-time-video-analytics-pipeline/

gRPC for low-impedence

Ingestion should be a group of components in a single microservice
Ingestion -
  Contains Preprocessor
  Forwards either frames or video segments to VCR service

Video transcoding - containerize

Transcoding in AWS / Only upload Raw files - Reduce Bandwidth Usage
Support Live Streaming - Feature Request
Sunset Video Toolbox

- Automated testing
- Event-based Fall Detection Service
- Replace Streams Service
  - Stream Preprocessor (OpenCV)
    - RTSP in / RTSP out
    - Scale, Format, Convert, Throttle, etc
  - Motion Detection (OpenCV)
    - RTSP in / Events out
    - Fire motion detection events
  - Motion Filter
    - RTSP In / Events In / RTSP out
    - Forwards frames for periods where motion was detect
  - Video Recorder
    - RTSP in / Events out

Need Highlevel Overview of Delivery and Technologies
  - K3s
  - Helm
  - Atlas
  - ECR
  - Kafka
  - Go
  - OpenCV / ffmpeg

Integration with Atlas
  - Replace device discovery with Atlas agent

Kubernetes has advantage due to resource limits
Resource limits on just docker compose?

Moving to: Event Stream Processing (ESP)
- https://www.ververica.com/what-is-stream-processing

Move Transcoding to Cloud

Guardian Platform

Infrastructure

- Atlas Agent
  - Sensor discovery
  - Sensor configuration
  - Workload configuration and provisioning

- Kubernetes/K3s
  - Workload management

- Kafka
  - Event stream processing (ESP)

- TBD
  - Metrics
  - Monitoring
  - Alerts

Sensor Components

- Video Stream Processor
  - Preprocess video stream (convert, scale, format, throttle)
  - Buffer video frames
  - In
    - stream: rtsp (from sensor)
  - Out
    - api: GetVideoFrameBuffer
    - message: VideoFramesReceived

- Video Stream Forwarder
  - Encode video frames and create a video stream (for live viewing) (throttle, blur)
  - In
    - message: VideoFramesReceived
  - Out
    - stream: rtsp

- Video Stream Recorder (DVR)
  - Combine video frames and create video files
  - In
    - message: MotionDetection
    - message: VideoFramesReceived
  - Out
    - file: video
    - message: VideoFileRecorded

- Video File Uploader
  - Upload recorded videos (prioritized) (to AWS S3)
  - In
    - message: VideoFileRecorded
    - message: VideoFilesRequested
    - message: FallDetected
    - message: SafetyCheckRequested
    - message: SafetyCheckScheduled
  - Out
    - api-call: upload video file (to AWS S3)
    - message: VideoFileUploaded

- Video File Reaper
  - Delete recorded videos
  - In
    - message: VideoFileRecorded
    - message: VideoFileUploaded
    - message: VideoFileRetained
  - Out
    - message: VideoFileDeleted

- Video File Transcoder
  - Transform video files (for web-viewing)
  - In
    - message: VideoFileUploaded
    - trigger: raw file uploaded (to AWS S3)
  - Out
    - api-call: upload video file (to AWS S3)
    - message: VideoTranscoded

- Snapshot Uploader
  - Periodically retreive and upload snapshots
  - In
    - api-call: get snapshot (from sensor)
    - api-call: get signed url (for AWS S3)
  - Out
    - api-call: upload snapshot (to AWS S3)

Monitoring Components

- AI Processor
  - Utilizes GPU(s) to process AI models
  - In
    - api-call: Video Stream Processor->GetVideoFrameBuffer
  - Out:
    - message: AIResult

- Motion Detector
  - Detect motion
  - In
    - api-call: Video Stream Processor->GetVideoFrameBuffer
  - Out
    - message: MotionDetection

- OTG Event Scorer
  - Score video frames for on the ground events
  - In
    - message: AIResult
  - Out
    - message: OTGEventScore

- LTS Event Scorer
  - Score video frames for lie to sit events
  - In
    - message: AIResult
  - Out
    - message: LTSEventScore

- Fall Detector
  - Detect fall events
  - In
    - message: MotionDetection
    - message: OTGEventScore
    - message: LTSEventScore
  - Out
    - message: FallDetection

- Safety Checker
  - Periodically request safety checks
  - In
    - schedule
  - Out:
    - message: SafetyCheckScheduled

Platform Components

- Cloud Event Sync
  - Receive events from Guardian and publish to cloud services
  - Poll cloud services for events and publish on Guardian





Guardian Roadmap

- Move video transcoding to cloud
  - Implement Video Transcoding Service V1 in AWS Lambda
  - Integrate Video Transcoding Service with Legacy Guardian (trigger on raw file upload)
  - Implement feature toggle on legacy Guardian to disable transcoding
  - Rollout / monitor
- Migrate stream processing to OpenCV
  - Implement Workload Management Platform (Kubernetes)
  - Implement Sensor Stream Processing Service V1
    - Integrate with legacy Redis
    -
  - Implement Video Recording Service V1
    - Integrate with legacy Redis
    - Write files to legacy raw file location
  - Implement service deployment (via Atlas or Ansible)
  - Implement feature toggle in legacy Guardian to disable motion detection
- Migrate motion detection to OpenCV
  - Implement Motion Detection Service V1
    - Use OpenCV
    - Read frame events legacy Redis
    - Write to legacy Guardian database
  - Implement service deployment (via Atlas or Ansible)
  - Implement feature toggle in legacy Guardian to disable motion detection
-
- Add live video monitoring
  - TBD

- Build Motion Detection Service V2
  - Implement event processing infrastructure
  - Spike: Evaluate event stream processing technology
    - Must support stateful event stream processing
    - Must guarantee at least once, ordered message delivery
    - Must support single node deployment
    - Must have low processing overhead
    - Consider Flink, Kafka, RedisEdge (Pub/Sub), Postgres (Listen,Notify), Sqlite
  - Implement Event Stream Processing Platform
  - Integrate Event Stream Processing Platform with Legacy Guardian
  - Implement Facility Event Sync Service
  - Integrate
- Implement AI V1
  - Spike: Evaluate concurrent kernel execution (multiple AI processes/GPU, multiple AI models/GPU)
    - https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#asynchronous-concurrent-execution


- Sensor Services
  - Sensor Stream Processing Service
    - RTSP stream in
    - Sensor video frame event out
    - Preprocesses stream (convert, scale, format, throttle, etc)
    - Publish video frames from sensor
  - Sensor Health Service
    - Sensor video frame event in
    - Sensor snapshot event in
    - Sensor health event out
    - Analyze sensor for degraded/healthy state
  - Sensor Snapshot Service
    - Periodic sensor API call
    - Sensor snapshot event out
    - Retrieves and publishes sensor snapshots

Video Gaps
Video Duration (Outage)


1. Move Video Transcoding to AWS
  1.1. Implement Video Transcoding Service V1 in AWS Lambda
  1.2. Integrate Video Transcoding Service with Legacy Guardian (Trigger Lambda on Raw Video Upload)
  1.3. Setup CI/CD for AWS Lambda
2. Establish NextGen Architecture
  2.1. Setup Workload Management Platform on Guardian (Kubernetes/K3s)
  2.2. Setup CI/CD for Workload Deployments to Guardian (Kubernetes/Atlas)
3. Implement Stream Processing using OpenCV (on NextGen Architecture)
  3.1. Implement Sensor Stream Processing Service V1
  3.2. Implement Video Recording Service V1
  3.3. Implement Event Stream Processing Platform (RedisEdge, Kafka?)
  3.4. Integrate Stream Processing with Legacy Guardian
4. Implement Motion Detection using OpenCV (on NextGen Architecture)
  4.1. Implement Motion Detection Service V1
  4.2. Integrate Motion Detection with Legacy Guardian
5. Prototype Video Live Streaming
