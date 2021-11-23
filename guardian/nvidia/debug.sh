#!/usr/bin/env bash

################################################################################
$ nvidia-container-cli info
NVRM version:   495.29.05
CUDA version:   11.5

Device Index:   0
Device Minor:   0
Model:          NVIDIA GeForce GTX 1050 Ti
Brand:          GeForce
GPU UUID:       GPU-b7545879-da0b-f040-aa8d-3b118a9b258c
Bus Location:   00000000:01:00.0
Architecture:   6.1

Device Index:   1
Device Minor:   1
Model:          NVIDIA GeForce GTX 1050 Ti
Brand:          GeForce
GPU UUID:       GPU-a7f3452d-0371-24a2-e74f-2cc04322df44
Bus Location:   00000000:02:00.0
Architecture:   6.1

################################################################################
$ nvidia-container-cli -k -d /dev/tty info

-- WARNING, the following logs are for debugging purposes only --

I1119 19:50:37.500863 9654 nvc.c:372] initializing library context (version=1.6.0, build=dd2c49d6699e4d8529fbeaa58ee91554977b652e)
I1119 19:50:37.500951 9654 nvc.c:346] using root /
I1119 19:50:37.500962 9654 nvc.c:347] using ldcache /etc/ld.so.cache
I1119 19:50:37.500971 9654 nvc.c:348] using unprivileged user 1001:1001
I1119 19:50:37.501012 9654 nvc.c:389] attempting to load dxcore to see if we are running under Windows Subsystem for Linux (WSL)
I1119 19:50:37.501223 9654 nvc.c:391] dxcore initialization failed, continuing assuming a non-WSL environment
W1119 19:50:37.503370 9655 nvc.c:269] failed to set inheritable capabilities
W1119 19:50:37.503465 9655 nvc.c:270] skipping kernel modules load due to failure
I1119 19:50:37.504003 9656 driver.c:101] starting driver service
I1119 19:50:37.509811 9654 nvc_info.c:758] requesting driver information with ''
I1119 19:50:37.510604 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvoptix.so.495.29.05
I1119 19:50:37.510629 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-tls.so.495.29.05
I1119 19:50:37.510644 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-rtcore.so.495.29.05
I1119 19:50:37.510659 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-ptxjitcompiler.so.495.29.05
I1119 19:50:37.510678 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-opticalflow.so.495.29.05
I1119 19:50:37.510696 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-opencl.so.495.29.05
I1119 19:50:37.510710 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-ngx.so.495.29.05
I1119 19:50:37.510722 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.495.29.05
I1119 19:50:37.510741 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-glvkspirv.so.495.29.05
I1119 19:50:37.510792 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-glsi.so.495.29.05
I1119 19:50:37.510821 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-glcore.so.495.29.05
I1119 19:50:37.510836 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-fbc.so.495.29.05
I1119 19:50:37.510885 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-encode.so.495.29.05
I1119 19:50:37.510906 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-eglcore.so.495.29.05
I1119 19:50:37.510924 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-compiler.so.495.29.05
I1119 19:50:37.510940 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-cfg.so.495.29.05
I1119 19:50:37.510980 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvidia-allocator.so.495.29.05
I1119 19:50:37.511020 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libnvcuvid.so.495.29.05
I1119 19:50:37.511090 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libcuda.so.495.29.05
I1119 19:50:37.511167 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libGLX_nvidia.so.495.29.05
I1119 19:50:37.511183 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libGLESv2_nvidia.so.495.29.05
I1119 19:50:37.511196 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libGLESv1_CM_nvidia.so.495.29.05
I1119 19:50:37.511235 9654 nvc_info.c:171] selecting /usr/lib/x86_64-linux-gnu/libEGL_nvidia.so.495.29.05
W1119 19:50:37.511261 9654 nvc_info.c:397] missing library libnvidia-nscq.so
W1119 19:50:37.511263 9654 nvc_info.c:397] missing library libnvidia-fatbinaryloader.so
W1119 19:50:37.511264 9654 nvc_info.c:397] missing library libvdpau_nvidia.so
W1119 19:50:37.511266 9654 nvc_info.c:397] missing library libnvidia-ifr.so
W1119 19:50:37.511285 9654 nvc_info.c:397] missing library libnvidia-cbl.so
W1119 19:50:37.511287 9654 nvc_info.c:401] missing compat32 library libnvidia-ml.so
W1119 19:50:37.511309 9654 nvc_info.c:401] missing compat32 library libnvidia-cfg.so
W1119 19:50:37.511311 9654 nvc_info.c:401] missing compat32 library libnvidia-nscq.so
W1119 19:50:37.511313 9654 nvc_info.c:401] missing compat32 library libcuda.so
W1119 19:50:37.511317 9654 nvc_info.c:401] missing compat32 library libnvidia-opencl.so
W1119 19:50:37.511319 9654 nvc_info.c:401] missing compat32 library libnvidia-ptxjitcompiler.so
W1119 19:50:37.511322 9654 nvc_info.c:401] missing compat32 library libnvidia-fatbinaryloader.so
W1119 19:50:37.511343 9654 nvc_info.c:401] missing compat32 library libnvidia-allocator.so
W1119 19:50:37.511346 9654 nvc_info.c:401] missing compat32 library libnvidia-compiler.so
W1119 19:50:37.511348 9654 nvc_info.c:401] missing compat32 library libnvidia-ngx.so
W1119 19:50:37.511351 9654 nvc_info.c:401] missing compat32 library libvdpau_nvidia.so
W1119 19:50:37.511354 9654 nvc_info.c:401] missing compat32 library libnvidia-encode.so
W1119 19:50:37.511357 9654 nvc_info.c:401] missing compat32 library libnvidia-opticalflow.so
W1119 19:50:37.511360 9654 nvc_info.c:401] missing compat32 library libnvcuvid.so
W1119 19:50:37.511362 9654 nvc_info.c:401] missing compat32 library libnvidia-eglcore.so
W1119 19:50:37.511382 9654 nvc_info.c:401] missing compat32 library libnvidia-glcore.so
W1119 19:50:37.511385 9654 nvc_info.c:401] missing compat32 library libnvidia-tls.so
W1119 19:50:37.511387 9654 nvc_info.c:401] missing compat32 library libnvidia-glsi.so
W1119 19:50:37.511390 9654 nvc_info.c:401] missing compat32 library libnvidia-fbc.so
W1119 19:50:37.511393 9654 nvc_info.c:401] missing compat32 library libnvidia-ifr.so
W1119 19:50:37.511395 9654 nvc_info.c:401] missing compat32 library libnvidia-rtcore.so
W1119 19:50:37.511398 9654 nvc_info.c:401] missing compat32 library libnvoptix.so
W1119 19:50:37.511401 9654 nvc_info.c:401] missing compat32 library libGLX_nvidia.so
W1119 19:50:37.511403 9654 nvc_info.c:401] missing compat32 library libEGL_nvidia.so
W1119 19:50:37.511406 9654 nvc_info.c:401] missing compat32 library libGLESv2_nvidia.so
W1119 19:50:37.511409 9654 nvc_info.c:401] missing compat32 library libGLESv1_CM_nvidia.so
W1119 19:50:37.511412 9654 nvc_info.c:401] missing compat32 library libnvidia-glvkspirv.so
W1119 19:50:37.511415 9654 nvc_info.c:401] missing compat32 library libnvidia-cbl.so
I1119 19:50:37.511553 9654 nvc_info.c:297] selecting /usr/bin/nvidia-smi
I1119 19:50:37.511561 9654 nvc_info.c:297] selecting /usr/bin/nvidia-debugdump
I1119 19:50:37.511568 9654 nvc_info.c:297] selecting /usr/bin/nvidia-persistenced
I1119 19:50:37.511579 9654 nvc_info.c:297] selecting /usr/bin/nvidia-cuda-mps-control
I1119 19:50:37.511613 9654 nvc_info.c:297] selecting /usr/bin/nvidia-cuda-mps-server
W1119 19:50:37.511640 9654 nvc_info.c:423] missing binary nv-fabricmanager
I1119 19:50:37.511650 9654 nvc_info.c:341] listing firmware path /lib/firmware/nvidia/495.29.05
I1119 19:50:37.511660 9654 nvc_info.c:520] listing device /dev/nvidiactl
I1119 19:50:37.511662 9654 nvc_info.c:520] listing device /dev/nvidia-uvm
I1119 19:50:37.511665 9654 nvc_info.c:520] listing device /dev/nvidia-uvm-tools
I1119 19:50:37.511696 9654 nvc_info.c:520] listing device /dev/nvidia-modeset
I1119 19:50:37.511707 9654 nvc_info.c:341] listing ipc path /run/nvidia-persistenced/socket
W1119 19:50:37.511716 9654 nvc_info.c:347] missing ipc path /var/run/nvidia-fabricmanager/socket
W1119 19:50:37.511740 9654 nvc_info.c:347] missing ipc path /tmp/nvidia-mps
I1119 19:50:37.511760 9654 nvc_info.c:814] requesting device information with ''
I1119 19:50:37.518047 9654 nvc_info.c:705] listing device /dev/nvidia0 (GPU-b7545879-da0b-f040-aa8d-3b118a9b258c at 00000000:01:00.0)
I1119 19:50:37.523602 9654 nvc_info.c:705] listing device /dev/nvidia1 (GPU-a7f3452d-0371-24a2-e74f-2cc04322df44 at 00000000:02:00.0)
NVRM version:   495.29.05
CUDA version:   11.5

Device Index:   0
Device Minor:   0
Model:          NVIDIA GeForce GTX 1050 Ti
Brand:          GeForce
GPU UUID:       GPU-b7545879-da0b-f040-aa8d-3b118a9b258c
Bus Location:   00000000:01:00.0
Architecture:   6.1

Device Index:   1
Device Minor:   1
Model:          NVIDIA GeForce GTX 1050 Ti
Brand:          GeForce
GPU UUID:       GPU-a7f3452d-0371-24a2-e74f-2cc04322df44
Bus Location:   00000000:02:00.0
Architecture:   6.1
I1119 19:50:37.523624 9654 nvc.c:423] shutting down library context
I1119 19:50:37.523913 9656 driver.c:163] terminating driver service
I1119 19:50:37.524099 9654 driver.c:203] driver service terminated successfully

################################################################################
$ nvidia-container-cli list
/dev/nvidiactl
/dev/nvidia-uvm
/dev/nvidia-uvm-tools
/dev/nvidia-modeset
/dev/nvidia0
/dev/nvidia1
/usr/bin/nvidia-smi
/usr/bin/nvidia-debugdump
/usr/bin/nvidia-persistenced
/usr/bin/nvidia-cuda-mps-control
/usr/bin/nvidia-cuda-mps-server
/usr/lib/x86_64-linux-gnu/libnvidia-ml.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-cfg.so.495.29.05
/usr/lib/x86_64-linux-gnu/libcuda.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-opencl.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-ptxjitcompiler.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-allocator.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-compiler.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-ngx.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-encode.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-opticalflow.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvcuvid.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-eglcore.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-glcore.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-tls.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-glsi.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-fbc.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-rtcore.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvoptix.so.495.29.05
/usr/lib/x86_64-linux-gnu/libGLX_nvidia.so.495.29.05
/usr/lib/x86_64-linux-gnu/libEGL_nvidia.so.495.29.05
/usr/lib/x86_64-linux-gnu/libGLESv2_nvidia.so.495.29.05
/usr/lib/x86_64-linux-gnu/libGLESv1_CM_nvidia.so.495.29.05
/usr/lib/x86_64-linux-gnu/libnvidia-glvkspirv.so.495.29.05
/run/nvidia-persistenced/socket

################################################################################
$ nvidia-smi
Fri Nov 19 19:46:48 2021
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 495.29.05    Driver Version: 495.29.05    CUDA Version: 11.5     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  On   | 00000000:01:00.0 Off |                  N/A |
| 33%   24C    P8    N/A /  75W |      1MiB /  4040MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  NVIDIA GeForce ...  On   | 00000000:02:00.0 Off |                  N/A |
| 33%   23C    P8    N/A /  75W |      1MiB /  4040MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+


################################################################################
