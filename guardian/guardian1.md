# Guardian 1.x Processing

## Streams

- Watch sensor (`video-toolbox`)
  - Connect to sensor
  - Receive/filter packets
  - Create frame
  - Throttle FPS
  - Convert to RGB
  - Scale frame
  - Encode frame
  - Write frame to file
- Publish received frame (for AI processing)
  - `<redis> PUBLISH channel ( new_frame )`
- Process completed video
  - Move video file
  - Enqueue video for processing (on `video-toolbox` thread)
  - Dequeue video for processing (on main thread)
  - Skip videos without recent motion detection
    - `<redis> GET camera ( last_motion, last_motion_check )`
  - Move video file (again)
  - Process AI outputs
    - `<mysql> UPDATE sy_videos ( to_keep, priority )`
    - `<mysql> INSERT sy_ai_outputs ( video_id, ai_type, event_detected, details, ... )`
  - Upload video if flagged `to_keep`

## AI

- Watch for published video frames
  - `<redis> SUBSCRIBE channel ( new_frame )`
- Skip frames without recent motion detection
  - `<redis> GET camera ( last_motion, last_motion_check )`
- Skip ignored frames
  - `<settings> ai_type { IGNORE_SENSORS }`
- Enqueue frames (from `video-toolbox` thread)
- Process frames
  - `<mysql> GET sy_sensors`
  - Process frame with AI model
  - Buffer frame processing response
- Detect event
  - Predict event with buffered frames
  - `<mysql> GET sy_sensors`
  - `<redis> SET camera ( last_ai_output_{ai-type}, last_alert, to_keep, priority )`

## Video

- Get videos to keep from Sky (time range, mac address)
  - `<sky> GET /api/guardians/updates`
- Mark videos to keep in DB
  - `<mysql> UPDATE sy_videos ( to_keep, priority )`
- Delete videos that won't be kept (stale, non-fall)
  - `<mysql> DELETE sy_videos`
- Get videos to upload
  - `<mysql> SELECT sy_videos ORDER BY priority, timestamp`
- Upload raw video
  - `<sky> GET /api/video_upload_urls`
  - `<aws> POST <video_upload_url>`
  - `<sky> POST /videos`
- Process (transcode) videos
  - ffmpeg
- Upload processed videos
  - `<sky> GET /api/video_upload_urls`
  - `<sky> POST api/videos/{}/notify_uploaded`
  - `rm <processed file>`
- Delete uploaded video
  - `<mysql> DELETE sy_videos`
  - `rm <physical file>`
