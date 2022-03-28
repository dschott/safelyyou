# TODO

```
Russ
System set up in k8s.
So the first thing would be to have a diagram of all the components separated by their subdomains and their docker containers?
Once we get that done I think we can start to separate out the containers?
And I think the first one would be to understand the camera container.
Probably isolating and pulling out the old camera code and replacing it with open CV?
```

The biggest benefit to containerization is separation of processes via networking
Allows the re-configuration, re-distribution of workloads with different needs. For example, the AI process is the
only one that needs GPUs. Everything else could run on raspberry pis.
Network/Device-Discovery, Sensor Stream, Sensor Automation, Sensor AutoConfig, Video Queue (Priority), Escalation,
Design for handling videos after downtime....
Detection (AI), - LTS, OTG, Motion
Diagram Nvidia driver container setup / node requirements
Events

GUARDIAN STATE MUST BE EPHEMERAL
  - The db must contain nothing of persistent value

Scheduled/Manual Events (Safety Checks)

- [ ] Add RELOAD_CONFIG env var; otherwise dont overwrite (what if mac address changes?)
- [ ] Revert upgrade to pytorch version / pin to x86_64
- [ ] Convert all x86_64 platform references to amd64
- [ ] Generate Fake alarms for LTS / OTG - Need test hooks
- [ ] Design 2.0
- [ ] Video Toolbox / replacement
- [ ] Network discovery (NMap) service
- [ ] GoRTSPLib (RTSP 1.0 client and server library for the Go programming language, written for rtsp-simple-server.)
  - [ ] https://github.com/nareix/joy4/
  - [ ] https://github.com/Ullaakut/cameradar
  - [ ] https://github.com/horgh/videostreamer
  - [ ] https://github.com/djwackey/dorsvr
- [ ] GoCV/OpenCV
- [ ] Docker setup for accessing GPU / Test LTS
- [ ] Connecting to Staging sky to pull current models down.
- [ ] Simple way to support multiple configurations for different scenarios, Configs:
  - [ ] .env file... need to avoid devs overlapping each other (mac address)
  - [ ] Dev Laptop/Local Sky mock camera
  - [ ] Guardian/Local Sky with mock and real cameras
  - [ ] Guardian/Staging Sky with mock and real cameras
- [ ] Point guardian at new environment (help Jason?)
- [ ] Refactor streaming code (video toolbox) - Because can only accept 10 connections ??? Per Russ
- [ ] Connect guardian to staging Sky (VPN) pull down latest models
- [ ] Create issue for Amcrest camera discovery/configuration ()
- [ ] Guardian - ssl / nginx ssl config
- [ ] Guardian - Write all logs to stdout (AI / Motion etc) ... Fix logs for integration with existing log shipping
- [ ] Guardian - Fix sy_toolbox.log ... its not being created!
- [ ] Guardian - docker manual builds for multi-architecture
- [ ] Guardian - demo everything
- [ ] Guardian - SU_UID etc is not needed for OS X
- [ ] Guardian - Cleanup Readme
- [ ] Guardian - Document git submodules
- [ ] Guardian - Document adding dependencies to Dockerfile (re-running docker compose build)
- [ ] Guardian - Document /etc/hosts setup
  - [ ] /etc/hosts is needed for navigating with a browser
  - [ ] GUARDIAN_SKY_ADDRESS in docker compose
- [ ] Guardian - Update make docker-build build guardian:dev image and build all platforms
- [ ] Guardian - Document make docker-login
- [ ] Guardian - ./manage.py setup is really fucking slow on mac OS X (stalls right after: 0 static files copied to '/opt/safely-you/guardian/server/static', 48 unmodified.)
- [x] Guardian - Auto-launch sensor discovery
- [x] Guardian - cron jobs
- [ ] Guardian - Document using .env file (discovering physical cameras/pointing to remote sky host)
- [ ] Guardian - setup_unit should not be run on every start... How to deal with configfile copy?
- [ ] Guardian Setup - Physical Sensor -
  - [ ] Install vendor software
  - [ ] DHCP reservation
  - [ ] Configure .env with IP Address
  - [ ] Configure with camera configs
  - [ ] Setup sensor password (password is local to settings.json) What generates this password? Prevent it from being overwritten during setup.
  - [ ] Configure sensor in sky (needs to be assigned to a room and recording needs to be turned on)
- [ ] Guardian - Env Var for Settings File so can load a Guardian vs Cloud vs Local default config
- [ ] Guardian - resolve errors in /var/log/syslog startup
- [ ] Guardian - How to deal with logs from all the processes... need to redirect to stdout/stderr
- [x] Guardian - Run cron jobs as SafelyYou and log to main process stderr, stdout
- [ ] Guardian - Agent to push stream to cloud
- [ ] Cleanup sensor config logging (include config name in log messages)
- [x] Run `update_network_state` instead of `sensors -d` since it also assigns to the guardian... then run `services stream start` or `task check_data_stream`?
- [ ] Sky - settings.json setup for local / server config (AWS creds)
- [ ] Sky - AWS bucket for local dev (using staging) will collide with other users
- [ ] Sky - Clean database
- [ ] Need to run docker-login before docker compose build
- [ ] Wire in ./manage.py update ai model
- [ ] Update my netgear switch to devops account
- [ ] Guardian - Move python files to a root subdirectory to make packaging in docker easier
- [ ] Guardian - Get rid of the crontab file copy (symlink or tell cron about crontab location)
- [ ] Mysql wait for ready
- [ ] Mysql upgrade to 8.0
- [ ] Document that you have to setup your sensors in sky, assign to a room and enabled!
- [ ] Handle - AI / CUDA not supported on mac os
- [ ] Build a centralized scheduler for all things: reboots, snapshots, safety checks, etc
  - [ ] Track network latency, throughput for best times to upload?
  - [ ] Track motion per room. Trend and identify good times to reboot cameras. Reboot more agressively.
- [ ] Snapshots are oriented correctly but live feed is not Geovision tdr4703
- [ ] Do we do peridic reboots on Geovision?
- [ ] IR was not on (https://safelyyou.slack.com/archives/CFU6NS2LE/p1637761605091900)
- [ ] Deploy Guardian to Kubernetes in Cloud
- [ ] Decrease Guardian image size
- [ ] Add Github actions for Docker image build
- [ ] Git rid of buildx
- [ ] I installed libcudnn8 instead of 7 in docker... is this OK?
  - BKD Baywood
    - Rm 141 - 10.1.165.50  with MAC 00:13:E2:26:AC:2E
    - Rm 144 - 10.1.165.51 with MAC 00:13:E2:26:AA:EE
  - Hum Good Valle Verde
    - Rm 305.. IP 10.1.189.47, MAC 00:13:E2:26:C3:69
  - BV Rancho Palos Verde
    - Rm 143 ... IP 10.1.149.51, MAC 00:13:E2:27:63:6D
- [ ] Local cold storage of 24hr video storage to allow video requests for longer periods of time.
- [ ] Guardian Live Streaming --
- [ ] Setup docker credential helper on my local Guardian
- [ ] Setup SSM on my guardian
- [ ] How to manage images on guardian (pull and import into k3s ctr)
- [ ] Install on k3d mac
- [ ] Make file
  - [ ] Mock camera image / stream feed deployment
  - [ ] New image deployment
  - [ ] Image Pull policy
- [ ] Get rid of Docker Compose?
  - K3s/k3d can mount local drive for development?
  - https://stackoverflow.com/questions/47894378/is-it-possible-to-mount-a-local-computer-folder-to-kubernetes-for-development-l
  - How to handle arm64?
- [ ] k3s upgrades (upgrade controller)
  - <https://rancher.com/docs/k3s/latest/en/upgrades/automated/>
- [ ] prune images: `sudo k3s crictl rmi --prune`
- [ ] Switch ai_realtime from submodule to requirements:
  - git+ssh://github.com/SafelyYou-Inc/ai-realtime.git@v2.0.0#egg=ai_realtime&subdirectory=ai_realtime
- [ ] Is detectron2 needed for runtime or just development?
- [ ] Review: <https://safelyyou.slack.com/archives/CCCEU7V6X/p1638555220110200>
- [ ] Branching strategy
- [ ] Guardian: Switch to setup.py with build, test, deploy dependencies
- [ ] Guardian: Tests don't work
- [ ] Get rid of toolbox submodule
- [ ] Review pull requests from Raghav for cameras
- [ ] Guardian: Evaluate existing unit tests, cleanup, purge tests
- [ ] Guardian: Kubernetes pods not gracefully shutting down
- [ ] Guardian: Should deployment be a stateful set?
- [ ] Support TLS on camera feeds.
- [ ] USE_DOCKER should default to false
- [ ] Mac address in docker compose should use machcanger
- [ ] Document compose, k3s commands
  - [ ] Cleaning up images i.e. sudo k3s crictl rmi --prune, d system prune)
- [ ] How to deal with multiple log files and exporting?
- [ ] Document dc exec guardian bash (how to override the start command to test custom startups)
- [ ] Stop logging to safelyyou.log (already writing to stdout)
- [ ] Document that settings.json is never preserved... it is always overwritten (docker vs kube)
- [ ] Move docker subdirectories to build/
- [ ] add deep clean make target
- [ ] Document bind mounted files (live editing) and adding files to Dockerfile
- [ ] Create a src directory
- [ ] Document updating ai-realtime dependencies (detectron2)
- [ ] Split docker and k3s setup
- [ ] Document setting GUARDIAN_LOCAL_IP
- [ ] Test with USE_DOCKER=false
- [ ] Document: deepclean to remove runtime files
- [ ] Document: install latest docker desktop
- [ ] Document: Must run `make install`
  - to created guardian:dev
  - After updating requirements.txt
  - After updating base or dev Dockerfile
- [ ] TLS on cameras
- [ ] Guardian cloud deployment should allow depoyment/config of mock cameras and should be configured to only map those cameras.
- [ ] Document updating AI realtime
- [ ] Mock camera should actually do snapshots
- [ ] Mock camera should use uribinsrc and pull from remote urls
  - [ ] Creds
  - [ ] Copy local
  - [ ] Security concerns?
- [ ] Add a second guardian to compose file to test balancing, etc
- [ ] Cache base image in ecr


- Atlas
  - Scan
  - Camera Config
  - Deploy
- Stream Processor
  - Enable components
  - Single input
  - Multiple Outputs - Fan Out
  - Can be wired together
    - StreamProcessor talks to another StreamProcessor in the Cloud
  - Video storage
    - write to network volume?

- Kafka / MQTT
  - https://medium.com/python-point/mqtt-and-kafka-8e470eff606b
  - https://github.com/dchesterton/amcrest2mqtt
  - https://stackoverflow.com/questions/30955110/is-message-order-preserved-in-mqtt-messages
  - https://www.researchgate.net/publication/342943599_MQTT-SN_CoAP_and_RTP_in_wireless_IoT_real-time_communications/link/5f26f809a6fdcccc43a60510/download
  - There are options for ingesting MQTT messages directly into kafka. This could be valuable for cameras running AI. In that scenario we could publish standard MQTT messages containing AI scores to Kafka.
  - MQTT has QoS levels to control for message delivery guarantees
    - QoS level 0 “at most once”
    - QoS level 1 “at least one”
    - QoS level 2 “exactly once”
  - MQTT-SN introduces a new QoS level -1 which provides simple functionality by allowing a sensor send its data, without any congestion control, to a gateway. The gateway, in turns publishes these messages to the MQTT broker that forwards the traffic to an analytics server for further processing or playback.
    - Could be used for publishing AI results from wireless cameras
    - http://www.steves-internet-guide.com/mqtt-sn/

Live Streaming
- https://github.com/robmarkcole/mqtt-camera-streamer
- https://link.springer.com/article/10.1007/s00530-020-00674-5 (USD 39.95)
- Multiple FPS modes
  - Monitor mode (low fps) (watch multiple feeds)
  - Zoom mode (higher fps)

- Preprocessing
  - Where is blur done?
  - Preprocessing for AI
  - Preprocessing for viewing
  - Preprocessing for VCR

- AI on camera
  - Publish to kafka
  - Publish timeout (time sensitive)
  -



- Guardian Baseline Architecture Meetings
