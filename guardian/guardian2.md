# Guardian 2.x

## Road Map

- Finalize LTS detection testing/implementation

### Kubernetes Rollout

- Operationalize Guardians with Kubernetes (k3s)
- Rollout legacy Guardian codebase on Kubernetes (k3s)

### Cameras Refactor

- Add `cameras` resource
  - Replaces table: `sy_sensors`
  - Replaces model: `NSCamera`
- Add `camera-healthcheck` service
- Add `camera-snapshot` service
- Add `camera-stream` service
  - Replace `video-toolbox` stream processing

### Videos Refactor

- Add `videos` resource
  - Replace table: `sy_videos`
  - Replace model: `NSVideo`
- Add `video-transcoding` service
- Move transcoding of raw videos for web viewing to cloud (Sky?)
- Add `video-expiration` service

### Events Refactor

- Add `events` resource
  - Replaces table: `sy_ai_outputs`
- Add `motion-detection` service
  - Replace `video-toolbox` motion detection
- Add `safety-check` service
- Add `otg-detection` service
- Add `lts-detection` service

### Configuration Refactor

- Add Guardian server provisioning to Atlas
- Add camera discovery/configuration to Atlas

## Questions

- [ ] Will multiple services accessing the GPU be difficult to coordinate?
  - Is there any GPU sharing currently with models?
  - Limit GPU? <https://github.com/pytorch/pytorch/blob/37c1f4a7fef115d719104e871d0cf39434aa9d56/torch/cuda/memory.py#L75-L99>
- [ ] Load balancing (sensor assignment) across multiple Guardians
- [ ] Kubernetes single-node network optimization? Network saturation
- [ ] Should Guardian server nodes be clustered together in k3s?
  - [ ] Can we rely on Kubernetes workload scheduling for balancing cameras?
  - [ ] Resources Requests/Limits will cap the amount for processes that can be sceduled if a machine goes down
  - [ ] Should be able to force a workload rebalance
  - [ ] Would load-balancing acrosss AI processes be problematic (network traffic/latency)?
  - [ ] Can load-balancing prefer local node?
  - [ ] PodAffinity? NodeAffinity?
- [ ] How to deal with site settings.json files? They should typically not be hand edited on the box...
  - [ ] Settings.json goes away. Each service is independently configurable.
  - [ ] Use env vars instead of file Or... a settings service deployed to the Guardian (probably env vars)
- [ ] How to deal with video downtime correctly.
- [ ] What needs to be schedule across all Guardians? How?
- [ ] Stream encryption
- [ ] Use SQLite, possibly embedded in service containers. Which state is ephemeral?
- [ ] How to secure APIs to prevent unauthorized access?
- [ ] Should rely on k8s cron?
- [ ] Guardian no longer "self-configures". Atlas is responsible for this.

## TODO

- [ ] Deployments
  - [ ] Operations
    - k3s
    - helm
    - Nvidia driver
  - [ ] Image - all application dependencies
  - [ ] Move towards lightweight containers, only AI image would be big.
  - [ ] AI Models deployed as image?
- [ ] Productionize k8s
  - [ ] Operational issues for deployment, instrumentation, etc
  - [ ] Testing
  - [ ] Training (kubctl, helm)
  - [ ] Security (service account?)
  - [ ] dump_sensor_configs
- [ ] All config changes/Sky UI-driven requests must be async... Guardian periodically syncs and alters its state...
  - Guardian is a big state-machine
- AI only process frames on which motion has been detected

## Notes

- Alarms and events are not equivalent. All events are propagated to the Sky for further analysis.

## Design Considerations

- Services must deal with transient/semi-permanent internet outages.
- Service configuration must be pulled, not pushed. (e.g. via an agent on the Guardian side)

## Resource Families

### Network Resources

- Sensors
  - xxx
  - How will sensor assignment work? Atlas?
- Guardians
  - xxx
- Scans
  - Replaced by Atlas?
  - Scans the network for devices, fingerprints them and updates devices resource
  - Scans can be performed periodically or on demand
  - Routes:
    - `/network/scans`
    - `/network/scans/{id}`
    - `/network/scans:`
  - Scan specific subnets for connected devices
  - Scanning managed via scheduler
  - Write to Devices resource
  - Fingerprinting
    - Determine type of network device given an IP address.
  - Garbage collection

- Sync (TODO: Rename: report)
  - Sync local network state with Sky
  - Should maintain history? i.e. `/network/sync`
  - Syncs can be performed periodically or on demand
  - Operations:
    - Sync Now
      - Route: `/network/sync`
  - Sky endpoint: `/?`
  - Liveness/Health
- Sensors
  - Local storage of network device information
  - Streams
  - Snapshots
  - Operations:
    - Get Device
      - Route: `/network/sensors/{id}`
    - List Devices
      - Route: `/network/sensors`
      - Query Params: `Type`, `IP`, `Mac`, `State`
- Sensor Configuration
  - URL: `/site/configurations`
  - Guardian Provisioning
  - Sensor Provisioning
  - Guardian / Sensor assignment
  - Substream config
  - Substream parameter management
    - Quality, Framerate, etc
    - For different AI models, Livestream

### Event Resources

- Events
  - URL: `/events`
- OTG Detection
  - URL: `/events/otg`
  - Cuda/PyTorch
  - Model pushed via Atlas
- LTS Detection
  - URL: `/events/lts`
  - Cuda/PyTorch
  - Model pushed via Atlas
- Motion Detection
  - URL: `/events/motion`
  - Process video frames for pixel differences
  - Utilizes CPU
  - Currently uses MotionDetector from Video-Toolbox
- Safety Checks
  - URL: `/events/safety`
  - Periodically/manually trigger alarms.
  - Centrally scheduled (Sky).
  - Scanning managed via scheduler.

### Streams

- Stream
  - Either discovered or configured via Atlas???
- Ingestion
- Transcoding
- Recording
- Forwarding
  - 24/7 Monitoring
  - Throttle
  - Scaling
  - If transcoding on Guardian is used, videos may need to be published more frequently
- Snapshots (Event?)
- Encryption?


- Video
  - Tracking
  - Local Storage
  - Publish/Upload
  - Garbage Collection
  - Encryption?

- Operations
  - Nvidia driver management (driver container)
  - Load balancing multiple Guardians (if clustered)
  - Monitoring
  - Telemetry
  - Logging
