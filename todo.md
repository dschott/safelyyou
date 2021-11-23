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

Scheduled/Manual Events (Safety Checks)

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
- [ ] Guardian - Write all logs to stdout (AI / Motion etc)
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
- [ ] Guardian Live Streaming --
- [ ] Guardian - Move python files to a root subdirectory to make packaging in docker easier
- [ ] Guardian - Get rid of the crontab file copy (symlink or tell cron about crontab location)
- [ ] Mysql wait for ready
- [ ] Mysql upgrade to 8.0
- [ ] Document that you have to setup your sensors in sky, assign to a room and enabled!
- [ ] Handle - AI / CUDA not supported on mac os
Refactor for scalability and safety (uptime)
refactor for pull system (pull ai experiments down)
refactor for running more than 1 ai routine.
A/B Testing for new AI models
The ability to run a second model in silent mode and possibly collect alarms

Send to Magellin (so we can experiment and test) but dont escalate.

ability to execute binocular AI.

2 cameras in each room for redundancy, could we take advantage of this for AI
