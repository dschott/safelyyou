$ sudo /sbin/lsmod | grep ipmi
ipmi_ssif              32768  0
ipmi_si                57344  0
ipmi_devintf           20480  0
ipmi_msghandler        53248  3 ipmi_devintf,ipmi_si,ipmi_ssif
