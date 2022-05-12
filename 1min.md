For the changes tp only uploade the first minute of an OTG alarm...

Given the current Guardian architecure...

Videos flagged by AI will be pushed to Sky once every 7 minutes until AI stops flagging the videos.

If a video flagged by AI is tagged as a fall in Sky, all videos (in which case the 1

If a safety check occurs within 7 minutes after an OTG alarm, the safety check video will not be uploaded.

7 minutes is the period between subsequent videos flagged by AI as OTG are treated as separate alarms.

7 minutes is the time that must elapse before and alarming sensor



Track last_alarm_time

if
    event_detected=True &&
    last_alarm_time > 7 mins &&
    last_uploaded_video > 7 mins
    Do Alarm (set last_alarm_time and last_uploaded_video and upload)
Unless
    Any video to_keep=True within 7 minutes

Sky requests video buffer to keep
Videos flagged
Upload_Videos task runs and uploads
? Set last uploaded video on sy_sensor ?

Need to know if Sky flags a video as a fall
All videos from that time need to be uploaded until AI stops alarming

Tag video

Guardian Alarms append to existing alarms
Updates look up all recent sequences and then request a buffer

Need to track if Sky requests to_keep

```x
Old
Segment:  1.....2.....3.....4.....5.....6.....7.....8.....9.....10..../.11../.12../.13../...
Guardian: Alarm.Alarm./...../...../...../...../...../...../...../...../...../...../...../...
Notify:   y.....y.....n.....n.....n.....n.....n.....n.....n.....n.....n.....n.....n.....n...
Sky:      .Keep.Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep../...../...

New
Segment:  1.....2.....3.....4.....5.....6.....7.....8.....9.....10..../.11../.12../.13../...
Guardian: Alarm.Alarm./...../...../...../...../...../...../...../...../...../...../...../...
Notify:   y.....n.....n.....n.....n.....n.....n.....y.....n.....n.....n.....n.....n.....n...
Sky:      Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep..Keep../...../...../...
```

Sky needs to know about the alarm without the video?

# Alarm with Variable Size Post Buffer - 10m to 16m

During an Alarm on the Guardian (OTG score above threshold)

- Guardian uploads only first minute of Alarm
- Guardian uploads next video after 7 minutes
- For ROTG, Sky ensures at least 10m post buffer is uploaded

---

## Alarm Sequence - Notify Every Minute - 10m Post Buffer

---

---

| Minute 1 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |

---
---

| Minute 2 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |

---

---

| Minute 3 (No Alarm)    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |

---
---

## Alarm Sequence - Notify 1st Minute - 10m Post Buffer

---

| Minute 1 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |

---

| Minute 2 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |

---

| Minute 3 (No Alarm)    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |

---

## Alarm Sequence - Notify 1st Minute - 16m Post Buffer

---

| Minute 1 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |

---

| Minute 2 (Alarm)       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |

---

| Minute 3 (No Alarm)    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n | n |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |

---

| Minute 7 (No Alarm)    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n | n | n | n | n | n |   |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |

---

| Minute 8 (No Alarm)    | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|------------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Alarm:                 | Y | Y | Y | Y | Y | Y | Y | Y |   |   |   |   |   |   |   |   |   |   |   |   |
| Notify Sky:            | Y | n | n | n | n | n | n | Y |   |   |   |   |   |   |   |   |   |   |   |   |
| Sky Requests To Keep:  |   | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y | Y+|
