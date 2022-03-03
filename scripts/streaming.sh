gst-launch-1.0 multifilesrc location=mock_camera/resources/stream.ts loop=true name=src ! tsparse set-timestamps=true ! video/mpegts ! tsdemux ! video/x-h264 ! h264parse disable-passthrough=false ! rtph264pay name=pay0 pt=96

gst-launch-1.0 multifilesrc location=mock_camera/resources/stream.ts loop=true name=src ! tsparse set-timestamps=true ! video/mpegts ! tsdemux ! video/x-h264 ! h264parse disable-passthrough=false ! rtph264pay name=pay0 pt=96
-vcodec copy
ffmpeg -i 'rtsp://admin:asdqwe123!@192.168.1.41/media/video2' -c copy vid.mp4
ffmpeg -list_devices true -f dshow -i 'rtsp://admin:asdqwe123!@192.168.1.41/media/video2'


ffmpeg -hide_banner -rtsp_transport tcp -loglevel debug -fflags +genpts -i 'rtsp://admin:asdqwe123!@192.168.1.41/media/video2' -codec copy -y mock_camera/resources/stream.ts

ffmpeg -hide_banner -rtsp_transport tcp -loglevel debug -fflags +genpts -i 'rtsp://mock-camera/stream' -vcodec copy -y x.ts

-reset_timestamps 1 \
    -rtsp_transport tcp \
    -map 0 \
    -f segment \
    -segment_time 15 \
    -segment_format mp4


    ffmpeg -i rtsp://mock-camera:554/stream -c copy out.mp4


ffmpeg -stream_loop -1 -i mock_camera/resources/stream.ts -f mpegts -vcodec copy rtsp://0.0.0.0/stream

ffmpeg -stream_loop -1 -i mock_camera/resources/stream.ts -c copy -f rtsp rtsp://0.0.0.0/stream


ffmpeg -hide_banner -rtsp_transport tcp -i 'rtsp://localhost/stream' -c copy -y out.mp4



gstreamer1.0-plugins-ugly
