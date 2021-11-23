$ sudo lspci -vnnn
00:00.0 Host bridge [0600]: Intel Corporation Device [8086:9b33] (rev 05)
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: bus master, fast devsel, latency 0
        Capabilities: [e0] Vendor Specific Information: Len=10 <?>

00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 05) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 121
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 00005000-00005fff
        Memory behind bridge: a5000000-a60fffff
        Prefetchable memory behind bridge: 0000004020000000-0000004031ffffff
        Capabilities: [88] Subsystem: Super Micro Computer Inc Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) [15d9:1b6c]
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [a0] Express Root Port (Slot+), MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [140] Root Complex Link
        Capabilities: [1c0] Advanced Error Reporting
        Capabilities: [d94] #19
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:01.1 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x8) [8086:1905] (rev 05) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 122
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
        I/O behind bridge: 00004000-00004fff
        Memory behind bridge: a3000000-a40fffff
        Prefetchable memory behind bridge: 0000004000000000-0000004011ffffff
        Capabilities: [88] Subsystem: Super Micro Computer Inc Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x8) [15d9:1b6c]
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [a0] Express Root Port (Slot+), MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [140] Root Complex Link
        Capabilities: [1c0] Advanced Error Reporting
        Capabilities: [d94] #19
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:08.0 System peripheral [0880]: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th Gen Core Processor Gaussian Mixture Model [8086:1911]
        Subsystem: Super Micro Computer Inc Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th Gen Core Processor Gaussian Mixture Model [15d9:1b6c]
        Flags: fast devsel, IRQ 11
        Memory at 403211a000 (64-bit, non-prefetchable) [disabled] [size=4K]
        Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
        Capabilities: [dc] Power Management version 2
        Capabilities: [f0] PCI Advanced Features

00:12.0 Signal processing controller [1180]: Intel Corporation Device [8086:06f9]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: fast devsel, IRQ 11
        Memory at 4032119000 (64-bit, non-prefetchable) [disabled] [size=4K]
        Capabilities: [50] Power Management version 3
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-

00:14.0 USB controller [0c03]: Intel Corporation Device [8086:06ed] (prog-if 30 [XHCI])
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: bus master, medium devsel, latency 0, IRQ 127
        Memory at 4032100000 (64-bit, non-prefetchable) [size=64K]
        Capabilities: [70] Power Management version 2
        Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Capabilities: [90] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: xhci_hcd

00:14.2 RAM memory [0500]: Intel Corporation Device [8086:06ef]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: fast devsel
        Memory at 4032114000 (64-bit, non-prefetchable) [disabled] [size=8K]
        Memory at 4032118000 (64-bit, non-prefetchable) [disabled] [size=4K]
        Capabilities: [80] Power Management version 3

00:16.0 Communication controller [0780]: Intel Corporation Device [8086:06e0]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: fast devsel, IRQ 11
        Memory at 4032117000 (64-bit, non-prefetchable) [disabled] [size=4K]
        Capabilities: [50] Power Management version 3
        Capabilities: [8c] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [a4] Vendor Specific Information: Len=14 <?>

00:16.3 Serial controller [0700]: Intel Corporation Device [8086:06e3] (prog-if 02 [16550])
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: 66MHz, fast devsel, IRQ 19
        I/O ports at 6060 [size=8]
        Memory at a6524000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [50] Power Management version 3
        Kernel driver in use: serial

00:17.0 SATA controller [0106]: Intel Corporation Device [8086:06d2] (prog-if 01 [AHCI 1.0])
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 128
        Memory at a6520000 (32-bit, non-prefetchable) [size=8K]
        Memory at a6523000 (32-bit, non-prefetchable) [size=256]
        I/O ports at 6050 [size=8]
        I/O ports at 6040 [size=4]
        I/O ports at 6020 [size=32]
        Memory at a6522000 (32-bit, non-prefetchable) [size=2K]
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [70] Power Management version 3
        Capabilities: [a8] SATA HBA v1.0
        Kernel driver in use: ahci
        Kernel modules: ahci

00:1b.0 PCI bridge [0604]: Intel Corporation Device [8086:06c0] (rev f0) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 123
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
        Memory behind bridge: a6400000-a64fffff
        Capabilities: [40] Express Root Port (Slot+), MSI 00
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [90] Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Capabilities: [a0] Power Management version 3
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Access Control Services
        Capabilities: [150] Precision Time Measurement
        Capabilities: [220] #19
        Capabilities: [250] Downstream Port Containment
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:1c.0 PCI bridge [0604]: Intel Corporation Device [8086:06b8] (rev f0) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 124
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
        Capabilities: [40] Express Root Port (Slot-), MSI 00
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [90] Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Capabilities: [a0] Power Management version 3
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:1c.5 PCI bridge [0604]: Intel Corporation Device [8086:06bd] (rev f0) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 125
        Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
        Memory behind bridge: a6100000-a63fffff
        Capabilities: [40] Express Root Port (Slot+), MSI 00
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [90] Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Capabilities: [a0] Power Management version 3
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Access Control Services
        Capabilities: [150] Precision Time Measurement
        Capabilities: [220] #19
        Capabilities: [250] Downstream Port Containment
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:1c.7 PCI bridge [0604]: Intel Corporation Device [8086:06bf] (rev f0) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Bus: primary=00, secondary=06, subordinate=07, sec-latency=0
        I/O behind bridge: 00003000-00003fff
        Memory behind bridge: a1000000-a20fffff
        Capabilities: [40] Express Root Port (Slot+), MSI 00
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Capabilities: [90] Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Capabilities: [a0] Power Management version 3
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Access Control Services
        Capabilities: [150] Precision Time Measurement
        Capabilities: [220] #19
        Capabilities: [250] Downstream Port Containment
        Kernel driver in use: pcieport
        Kernel modules: shpchp

00:1f.0 ISA bridge [0601]: Intel Corporation Device [8086:0697]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: bus master, medium devsel, latency 0

00:1f.3 Audio device [0403]: Intel Corporation Device [8086:06c8]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: bus master, fast devsel, latency 32, IRQ 152
        Memory at 4032110000 (64-bit, non-prefetchable) [size=16K]
        Memory at 4032000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [50] Power Management version 3
        Capabilities: [80] Vendor Specific Information: Len=14 <?>
        Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

00:1f.4 SMBus [0c05]: Intel Corporation Device [8086:06a3]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: medium devsel, IRQ 11
        Memory at 4032116000 (64-bit, non-prefetchable) [size=256]
        I/O ports at efa0 [size=32]

00:1f.5 Serial bus controller [0c80]: Intel Corporation Device [8086:06a4]
        Subsystem: Super Micro Computer Inc Device [15d9:1b6c]
        Flags: fast devsel
        Memory at fe010000 (32-bit, non-prefetchable) [size=4K]

00:1f.6 Ethernet controller [0200]: Intel Corporation Device [8086:0d4c]
        Subsystem: Super Micro Computer Inc Device [15d9:0d4c]
        Flags: bus master, fast devsel, latency 0, IRQ 131
        Memory at a6500000 (32-bit, non-prefetchable) [size=128K]
        Capabilities: [c8] Power Management version 3
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Kernel driver in use: e1000e
        Kernel modules: e1000e

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP107 [GeForce GTX 1050 Ti] [10de:1c82] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd GP107 [GeForce GTX 1050 Ti] [1458:3746]
        Flags: bus master, fast devsel, latency 0, IRQ 130
        Memory at a5000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 4020000000 (64-bit, prefetchable) [size=256M]
        Memory at 4030000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 5000 [size=128]
        Expansion ROM at a6000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

01:00.1 Audio device [0403]: NVIDIA Corporation GP107GL High Definition Audio Controller [10de:0fb9] (rev a1)
        Subsystem: Gigabyte Technology Co., Ltd GP107GL High Definition Audio Controller [1458:3746]
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at a6080000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP107 [GeForce GTX 1050 Ti] [10de:1c82] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd GP107 [GeForce GTX 1050 Ti] [1458:3746]
        Flags: bus master, fast devsel, latency 0, IRQ 151
        Memory at a3000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 4000000000 (64-bit, prefetchable) [size=256M]
        Memory at 4010000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 4000 [size=128]
        Expansion ROM at a4000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

02:00.1 Audio device [0403]: NVIDIA Corporation GP107GL High Definition Audio Controller [10de:0fb9] (rev a1)
        Subsystem: Gigabyte Technology Co., Ltd GP107GL High Definition Audio Controller [1458:3746]
        Flags: bus master, fast devsel, latency 0, IRQ 18
        Memory at a4080000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

03:00.0 Non-Volatile memory controller [0108]: Toshiba America Info Systems Device [1179:011a] (prog-if 02 [NVM Express])
        Subsystem: Toshiba America Info Systems Device [1179:0001]
        Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 0
        Memory at a6400000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [40] Express Endpoint, MSI 00
        Capabilities: [80] Power Management version 3
        Capabilities: [90] MSI: Enable- Count=1/32 Maskable+ 64bit+
        Capabilities: [b0] MSI-X: Enable+ Count=33 Masked-
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [260] Latency Tolerance Reporting
        Capabilities: [300] #19
        Capabilities: [400] L1 PM Substates
        Kernel driver in use: nvme
        Kernel modules: nvme

05:00.0 Ethernet controller [0200]: Intel Corporation Device [8086:15f2] (rev 02)
        Subsystem: Super Micro Computer Inc Device [15d9:15f2]
        Flags: fast devsel, IRQ 10
        Memory at a6200000 (32-bit, non-prefetchable) [size=1M]
        Memory at a6300000 (32-bit, non-prefetchable) [size=16K]
        Expansion ROM at a6100000 [disabled] [size=1M]
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
        Capabilities: [70] MSI-X: Enable- Count=5 Masked-
        Capabilities: [a0] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Device Serial Number 3c-ec-ef-ff-ff-30-7b-1d
        Capabilities: [1c0] Latency Tolerance Reporting
        Capabilities: [1f0] Precision Time Measurement
        Capabilities: [1e0] L1 PM Substates

06:00.0 PCI bridge [0604]: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge [1a03:1150] (rev 04) (prog-if 00 [Normal decode])
        Flags: bus master, fast devsel, latency 0, IRQ 19
        Bus: primary=06, secondary=07, subordinate=07, sec-latency=32
        I/O behind bridge: 00003000-00003fff
        Memory behind bridge: a1000000-a20fffff
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Power Management version 3
        Capabilities: [80] Express PCI-Express to PCI/PCI-X Bridge, MSI 00
        Capabilities: [c0] Subsystem: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge [1a03:1150]
        Capabilities: [100] Virtual Channel
        Capabilities: [800] Advanced Error Reporting
        Kernel modules: shpchp

07:00.0 VGA compatible controller [0300]: ASPEED Technology, Inc. ASPEED Graphics Family [1a03:2000] (rev 41) (prog-if 00 [VGA controller])
        Subsystem: Super Micro Computer Inc ASPEED Graphics Family [15d9:1b6c]
        Flags: medium devsel, IRQ 19
        Memory at a1000000 (32-bit, non-prefetchable) [size=16M]
        Memory at a2000000 (32-bit, non-prefetchable) [size=128K]
        I/O ports at 3000 [size=128]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [40] Power Management version 3
        Capabilities: [50] MSI: Enable- Count=1/2 Maskable- 64bit+
        Kernel driver in use: ast
        Kernel modules: ast
