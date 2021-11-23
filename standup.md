# Standup

# 2021-11-19

- NMap in mac docker - Added DEVICE_DISCOVERY_IP_RANGES
- Connected to stage - local and mock cameras
- Loaded latest AI models
- Get AI to work in container
  - NVidia driver container (time = read and understand docs)
    - Disable Nouveau driver
    - Enable IPMI driver
    - Enable the i2c_core kernel module
    - Nvidia container toolkit
    - OS config
    - Docker config
  - NVidia pid handling for `nvidia-smi`
  - Mac OS is not supported - Settings profile for Mac OS, Guardian, (eventually cloud)
- Need to complete to test LTS in docker

## 2021-11-08

- Friday - Jason new office
- Camera Hacking - LTS models / Setup Amcrest Camera / IR mode
- Running out of connections (breaking)
- Write -> video  / Read <- queue

Eskaton Placerville

## 2021-10-29

- Containerized dev env on Guardian
  - Getting cameras connected
  - Added safelyyou user
  - Working out security (non-root, file permissions)
  - VSCode dev laptop remotely connected to guardian
- Loaded multiple OTG models using gpu_id (not validated using a camera yet)
- Moved guardian to separate network interface on firewall (VPN)
- Safety check review / test today
- Revisit AI/Video processing design / document - video toolbox interface/function / sky interface

---
`2021-09-20`
`Y`
- Guardian code AI/Video/Files review
- Setup / run Guardian (did not get to setup k3s yet)
`T`
- Review/document Guardian tasks
- Get Sky running locally
- Try to get MockCamera to work
- Create comprehensive component diagram
- Document third-party dependencies
- Evaluate value/feasibility of using Golang
- Setup company laptop
- Support
`B`
- none

---
`2021-09-17`
`Y:`
- Guardian running locally (no sky)
- Fix compose / python dep
- Document current system
  - Got docs to generate
  - Migrations to run
  - Created ERD
  - Created Class diagram
  - Tasks/Services
- Investigated KubeEdge more closely
- Reviewed RSTP
`T:`
- Investigate KubeEdge features/gaps
  - Setup server closet / power / networking
  - Deploy k3s to server and laptop
  - Deploy KubeEdge with laptop setup as cloud
  - Expense a surge protector
- Investigate AI / Video / File processing more deeply
`B:`
- Access (VPN,DEV,OPSGENIE)
- No Machine (may get today)

---
`2021-09-16`
`y:`
- Guardian / Visual Toolbox repo walkthrough w/Jason
- Planning/discussion for Guardian 2.0 tech stack
- Research on K8s at the edge (k3s, KubeEdge, Microk8s, Fledge, Akri)
- Tried and failed to get into Opsgeneie
- Setup personal laptop for dev
`t:`
- Continue research on K8s at the edge
- Poke at the Guardian codebase / db model
- Start documenting domain model
- Evaluate the state of Jira for Guardian work
`b:`
- No company laptop
