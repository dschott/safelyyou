# Requests

## First Login

```sh
$ curl http://192.168.1.41/device_cap.xml?t=1636726279432
<?xml version='1.0' encoding='utf-8'?>
<MWare>
        <!--  设备名称  -->
        <!--  设备运行类型  -->
        <DeviceType>1</DeviceType>
        <!--  产品类型(MW_PRODUCT_TYPE_E)  -->
        <ProductType>0</ProductType>
        <!--  设备支持的兼容类型数目  -->
        <Compatibility>1</Compatibility>
        <!--  MIB相关信息  -->
        <System>
                <ObjectID>1,3,6,1,4,1,25506,1,703</ObjectID>
                <ObjectIDLen>9</ObjectIDLen>
                <SDKUserNum>32</SDKUserNum>
                <SetRTCTime>1</SetRTCTime>
        </System>
        <!--  串口  -->
        <Serial>
                <Channel>0</Channel>
                <Serial0>
                        <Type>RS232</Type>
                </Serial0>
        </Serial>
        <!--  网口  -->
        <Network>
                <DDNS>
                        <Mode>0,5</Mode>
                </DDNS>
                <IPType>
                        <Mode>0,2</Mode>
                </IPType>
                <NetNum>1</NetNum>
                <Net0>
                        <NetName>eth0</NetName>
                        <ElecPort>0</ElecPort>
                        <RayPort>0</RayPort>
                </Net0>
                <!--  通用FTP  -->
                <BasicFTP>1</BasicFTP>
                <Email>1</Email>
                <ElectPortNum>1</ElectPortNum>
                <PortMode>0</PortMode>
                <WorkMode>2,1,6,4,3,7,0</WorkMode>
        </Network>
        <!--  编码能力  -->
        <Encode>
                <!-- 支持的最大流的个数  -->
                <MaxStream>3</MaxStream>
                <!--  隐藏流的个数（JPEG、MJPEG）  -->
                <!--  Windth*Hight*Framerate -->
                <VinMode>2688*1520*30,2688*1520*25,2560*1440*30,2560*1440*25,2304*1296*30,2304*1296*25,1920*1080*30,1920*1080*25</VinMode>
                <!-- Windth*Hight -->
                <Resolution>2688*1520,2560*1440,2304*1296,1920*1080,1280*720,704*576,704*288,640*360,352*288</Resolution>
                <Resolution1>1280*720,704*576,704*288,640*480,640*360,352*288</Resolution1>
                <Resolution2>640*360,352*288</Resolution2>
                <!--  3: MJPEG  -->
                <!--  6: H.264  -->
                <!-- 13: H.265-->
                <EncodeFormat>3,6,13</EncodeFormat>
                <Block16x16>
                        <!--  H.264的编码能力  -->
                        <EncodeCap6>
                                <ALONE>856548</ALONE>
                        </EncodeCap6>
                        <EncodeCap3>
                                <CONV>1:1</CONV>
                        </EncodeCap3>
                </Block16x16>
                <NoModifyMainPicSize>1</NoModifyMainPicSize>
                <MJPEGFrameRateLimit>
                        <Default>5</Default>
                        <PicSize>720*576</PicSize>
                        <LessThan>15</LessThan>
                </MJPEGFrameRateLimit>
                <!--  通用抓图  -->
                <BasicJPEG>1</BasicJPEG>
                <UCode>
                        <Mode>0,1</Mode>
                </UCode>
        </Encode>
        <!--  硬件  -->
        <!--  硬件  -->
        <Hardware>
                <SwitchIn>
                        <!-- 输入开关量的数目和列表 -->
                        <Channel>0</Channel>
                </SwitchIn>
                <SwitchOut>
                        <!-- 输出开关量的数目和列表 -->
                        <Channel>0</Channel>
                </SwitchOut>
        </Hardware>
        <!--  软件功能  -->
        <Function>
                <ROI>4</ROI>
                <MediaStream>1</MediaStream>
                <!--  支持夏令时  -->
                <DST>1</DST>
                <NewGuardPresetTime>1</NewGuardPresetTime>
                <Demo>
                        <!--是否支持数据包发送模式-->
                        <SendMode>1</SendMode>
                </Demo>
                <SeniorOSD>1</SeniorOSD>
        </Function>
        <OSD>
                <InfoOSD>
                        <!--  类型  -->
                        <!--  1 自定义 -->
                        <!--  2 时间 -->
                        <!--  4 云台坐标 -->
                        <!--  6 变倍 -->
                        <!--  7 预置位 -->
                        <!--  8 报警 -->
                        <!--  10 串口信息 -->
                        <!--  11 方位信息 -->
                        <Mode>1,2,16,17,15</Mode>
                        <Area>4</Area>
                        <Line>4</Line>
                </InfoOSD>
                <CoverOSD>
                        <Number>4</Number>
                </CoverOSD>
                <!-- 支持OSD字体效果 -->
                <!-- 0 背景 -->
                <!-- 1 描边 -->
                <!-- 2 空心 -->
                <!-- 3 正常 -->
                <FontStyle>
                        <Mode>0,3</Mode>
                </FontStyle>
                <FontSize>
                        <Mode>0,1,2</Mode>
                </FontSize>
                <Margin>
                        <Mode>0,1,2</Mode>
                </Margin>
        </OSD>
        <!--  音频  -->
        <Audio>
                <!-- 支持的音频格式 -->
                <!-- 1：G.711A -->
                <!-- 2: G.711U -->
                <!-- 6: AAC-LC -->
                <Mode>1,2</Mode>
                <AudioOut>
                        <!-- 设备支持的音频输出数目和列表 -->
                        <Channel>3</Channel>
                        <!-- 使用语音对讲的音频输出通道 -->
                        <VoiceIntercomOut>0</VoiceIntercomOut>
                        <Num>1</Num>
                        <Item0>
                                <Mode>0</Mode>
                        </Item0>
                </AudioOut>
                <AudioIn>
                        <!-- 随路音频的数量和列表 -->
                        <!-- 音频输入通道数目和列表 -->
                        <IndependentAudio>1</IndependentAudio>
                        <!-- 设备支持的语音对讲使用的音频输入通道 -->
                        <VoiceIntercomIn>0</VoiceIntercomIn>
                        <Num>1</Num>
                        <Item0>
                                <Mode>0</Mode>
                        </Item0>
                </AudioIn>
                <NoiseReduction>1</NoiseReduction>
                <SampleRate>
                        <Mode1>0</Mode1>
                        <Mode2>0</Mode2>
                </SampleRate>
        </Audio>
        <!--  流  -->
        <Video>
                <MediaStream>
                        <!-- 设备支持的流的数目 -->
                        <StreamNum>20</StreamNum>
                        <!-- 设备支持的每通道单播流数目 -->
                        <UniCastPerChannel>35</UniCastPerChannel>
                        <!-- 设备支持的每通道多播流数目 -->
                        <MultiCastPerChannel>1</MultiCastPerChannel>
                        <!--  通过sdk可创建的每通道单播流数目  -->
                        <!--  通过sdk可创建的每通道多播流数目  -->
                </MediaStream>
                <!--  获取一个I帧组所需缓冲的最大buffer size  -->
                <FrameBuffer>4096</FrameBuffer>
                <MaxBitRate>50</MaxBitRate>
        </Video>
        <!--  告警  -->
        <Alarm>
                <MaskDetection>
                        <Num>1</Num>
                </MaskDetection>
                <!--  运动检测支持区域数目  -->
                <MotionDetection>
                        <Num>4</Num>
                </MotionDetection>
                <!-- 非智能区域入侵支持区域数目 -->
                <NonSmartIntrusionZone>
                        <Num>1</Num>
                </NonSmartIntrusionZone>
                <!--  人形检测支持区域数目  -->
                <HumanShapeDetection>
                        <Num>1</Num>
                </HumanShapeDetection>
                <!--  警前录像时间  -->
                <Pre-RecordingBeforeAlarm>8192</Pre-RecordingBeforeAlarm>
        </Alarm>
        <!--  服务器  -->
        <Server>
                <!-- 是否支持VM服务器 -->
                <NTP>1</NTP>
                <!--是否支持BM服务器-->
                <NoBrand>1</NoBrand>
        </Server>
        <Image>
                <Scene>
                        <Mode>1,8,7,12,0</Mode>
                </Scene>
                <ImageType>0</ImageType>
                <Video>
                        <Exposure>
                                <!-- 1 auto -->
                                <!-- 2 manual -->
                                <!-- 3 custom -->
                                <!-- 4 shutter priority -->
                                <!-- 5 iris priority -->
                                <!-- 6 gain priority -->
                                <!-- 7 indoor 50HZ -->
                                <!-- 8 indoor 60HZ -->
                                <!-- 9 low motion blur  -->
                                <Mode>1,2,3,7,8,9</Mode>
                                <Shutter>
                                        <!-- 0: us, 1: 1/s -->
                                        <Unit>1</Unit>
                                        <SlowShutter>1</SlowShutter>
                                        <!-- shutter range (us) -->
                                        <Range>100000,1</Range>
                                        <FastRange>100000,25</FastRange>
                                        <SlowRange>100000,25</SlowRange>
                                </Shutter>
                                <Gain>
                                        <!-- gain range (db) -->
                                        <Range>0,100</Range>
                                        <MinRange>0,100</MinRange>
                                        <MaxRange>0,100</MaxRange>
                                </Gain>
                                <DayNight>
                                        <!-- 1 auto -->
                                        <!-- 2 manual(color, B&W) -->
                                        <Mode>1,2</Mode>
                                        <Time>
                                                <!-- Switch time (s) -->
                                                <Range>3,120</Range>
                                        </Time>
                                </DayNight>
                                <Metering>
                                        <!-- 1 center metering -->
                                        <!-- 2 area metering -->
                                        <!--  6 spot metering -->
                                        <Mode>1,2,6</Mode>
                                </Metering>
                                <!-- 1 exposure compensation -->
                                <Compensate>1</Compensate>
                                <WDR>
                                        <!-- 1 auto -->
                                        <!-- 2 manual -->
                                        <Mode>2</Mode>
                                </WDR>
                        </Exposure>
                        <WhiteBalance>
                                <!-- 1 auto -->
                                <!-- 2 fine tune(manual) -->
                                <!-- 4 outdoor -->
                                <!-- 7 sodium mode  -->
                                <!-- 8 lock wb -->
                                <!-- 10 auto2 -->
                                <Mode>1,2,4,7,8</Mode>
                        </WhiteBalance>
                        <Enhance>
                                <Brightness>1</Brightness>
                                <Contrast>1</Contrast>
                                <Saturation>1</Saturation>
                                <Sharpness>
                                        <!-- 1 auto -->
                                        <!-- 2 manual -->
                                        <Mode>2</Mode>
                                </Sharpness>
                                <Denoise>
                                        <_2D>1</_2D>
                                        <_3D>1</_3D>
                                </Denoise>
                                <Mirror>
                                        <!-- 1 flip -->
                                        <!-- 2 mirror -->
                                        <!-- 3 flip and mirror -->
                                        <!-- 4 rotate clockwise -->
                                        <Mode>1,2,3</Mode>
                                </Mirror>
                        </Enhance>
                        <Defog>
                                <!-- 1 auto defog -->
                                <!-- 2 manual defog -->
                                <Mode>2</Mode>
                        </Defog>
                        <LedCtrl>
                                <LightMode>
                                        <Mode>3</Mode>
                                </LightMode>
                                <IrCtrl>
                                        <!-- 1 Overall Mode -->
                                        <!-- 2 Extreme Mode -->
                                        <!-- 3 Preset  Mode(Road Mode) -->
                                        <!-- 4 Manual  Mode -->
                                        <!-- 5 Preset  Mode(Yard Mode) -->
                                        <Mode>1,2,4</Mode>
                                        <DefaultMode>1</DefaultMode>
                                        <LedNum>1</LedNum>
                                        <LedLevel0>
                                                <Range>0,1000</Range>
                                        </LedLevel0>
                                </IrCtrl>
                                <LedCtrlEnable>1</LedCtrlEnable>
                        </LedCtrl>
                </Video>
        </Image>
        <!--  智能 -->
        <Stor>
                <!-- 支持的存储资源 -->
                <!-- 0: 储存卡 -->
                <!-- 1：网络硬盘 -->
                <Storage>
                        <Mode>0</Mode>
                        <RecordPlayBack>1</RecordPlayBack>
                        <VideoDownload>1</VideoDownload>
                </Storage>
                <!--设备支持的单通道上的存储流数-->
                <StorStreamNum>5</StorStreamNum>
                <!--单张图片共享内存最大值，单位为KB-->
                <PicMaxMemory>0</PicMaxMemory>
                <!--缓存的最大图片数-->
                <BufferMaxPicNum>0</BufferMaxPicNum>
                <!--目录下允许的最大文件数 -->
                <DirMaxFileNum>200</DirMaxFileNum>
                <!--间隔多少个二级索引与磁盘同步一次-->
                <StorIpsanFlushNum>16</StorIpsanFlushNum>
                <!--上传至BM的缓存补录文件格式 对应值: MP_STORAGE_TYPE_E-->
                <StorBMFileType>1</StorBMFileType>
        </Stor>
        <Custom>
                <CustomEncryption>1</CustomEncryption>
        </Custom>
</MWare>
```

```sh
$ curl http://192.168.1.41/LAPI/V1.0/System/FirstLogin?randomKey=1636726279481
{
  "Response": {
    "ResponseURL": "/LAPI/V1.0/System/FirstLogin",
    "CreatedID": -1,
    "ResponseCode": 0,
    "SubResponseCode": 0,
    "ResponseString": "Succeed",
    "StatusCode": 0,
    "StatusString": "Succeed",
    "Data": {
      "IsFirstLogin": 1
    }
  }
}
```

```sh
$ curl -s http://192.168.1.41/LAPI/V1.0/System/DeviceWorkMode?randomKey=1636726704082 | jq .
{
  "Response": {
    "ResponseURL": "/LAPI/V1.0/System/DeviceWorkMode",
    "CreatedID": -1,
    "ResponseCode": 0,
    "SubResponseCode": 0,
    "ResponseString": "Succeed",
    "StatusCode": 0,
    "StatusString": "Succeed",
    "Data": {
      "Mode": 1
    }
  }
}
```

```sh
$ curl -s http://192.168.1.41/LAPI/V1.0/System/Security/RSA?randomKey=1636726704119 | jq
{
  "Response": {
    "ResponseURL": "/LAPI/V1.0/System/Security/RSA",
    "CreatedID": -1,
    "ResponseCode": 0,
    "SubResponseCode": 0,
    "ResponseString": "Succeed",
    "StatusCode": 0,
    "StatusString": "Succeed",
    "Data": {
      "RSAPublicKeyE": "10001",
      "RSAPublicKeyN": "CA7A6FF7D0B203F27247B7FEBDD17878B56B9B33A83DD2108AD6A8FA1BB7C6FB0E84E56B685C80EE8CB79E501BA66B22FAFDEE10EB8B9617DCA3DE07261D87CC05BF7901F3BAF6659515C2D6772AFD4C40FECA5380C42924EE34F0F779C55C52063F0E5A320E7DA85CBA56EF1323A243396324D879B12A67062FE9C8E3EE93F5"
    }
  }
}
```

## Set Admin Password

Click Submit

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Channel/0/System/Users/Users/0' \
  -X 'PUT' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: http://192.168.1.41' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636726704009' \
  --data-raw $'{"RSAPublicKey":{"RSAPublicKeyE":"10001","RSAPublicKeyN":"CA7A6FF7D0B203F27247B7FEBDD17878B56B9B33A83DD2108AD6A8FA1BB7C6FB0E84E56B685C80EE8CB79E501BA66B22FAFDEE10EB8B9617DCA3DE07261D87CC05BF7901F3BAF6659515C2D6772AFD4C40FECA5380C42924EE34F0F779C55C52063F0E5A320E7DA85CBA56EF1323A243396324D879B12A67062FE9C8E3EE93F5"},"Passwd":"BV6/5nn2TBs4rcVaeFEP1KRaq5D6CoIiBgAHih/cNCV54YFFuCptIQv2lQxE2JXV7bDs7nKZNxHVPEq2KiF7anprsiDok2Epo1uTGXQ/6HbYKbmJhoZ5BNFsjH2KsPDUd7HRaJua9/KNNBwZM1VpSyaSsBpS9nrnkKhxu3I1Kuw=","Name":"admin","ID":0}\r\n' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Channel/0/System/Users/Users/0",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": "null"
	}
}

```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/FirstLogin' \
  -X 'PUT' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: http://192.168.1.41' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636726704009' \
  --data-raw $'{"IsFirstLogin":0}\r\n' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/FirstLogin",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": "null"
	}
}

```


## Once Password Set - Nav to URL

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/FirstLogin?randomKey=1636727589322' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636727589279' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/FirstLogin",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"IsFirstLogin":	0
}
	}
}
```

## HACK

curl 'http://192.168.1.41/LAPI/V1.0/Channel/0/System/Users/Users/0' \
  -X 'PUT' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: http://192.168.1.41' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636726704009' \
  --data-raw $'{"RSAPublicKey":{"RSAPublicKeyE":"10001","RSAPublicKeyN":"CA7A6FF7D0B203F27247B7FEBDD17878B56B9B33A83DD2108AD6A8FA1BB7C6FB0E84E56B685C80EE8CB79E501BA66B22FAFDEE10EB8B9617DCA3DE07261D87CC05BF7901F3BAF6659515C2D6772AFD4C40FECA5380C42924EE34F0F779C55C52063F0E5A320E7DA85CBA56EF1323A243396324D879B12A67062FE9C8E3EE93F5"},"Passwd":"BV6/5nn2TBs4rcVaeFEP1KRaq5D6CoIiBgAHih/cNCV54YFFuCptIQv2lQxE2JXV7bDs7nKZNxHVPEq2KiF7anprsiDok2Epo1uTGXQ/6HbYKbmJhoZ5BNFsjH2KsPDUd7HRaJua9/KNNBwZM1VpSyaSsBpS9nrnkKhxu3I1Kuw=","Name":"admin","ID":0}\r\n' \
  --compressed \
  --insecure


## Login

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/Security/Login' \
  -X 'PUT' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/System/Security/Login", response="91620668f8684e73a8636b6fd2e5edf6", qop="auth", nc="00000002", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: http://192.168.1.41' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --data-raw $'{}\r\n' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/Security/Login",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": "null"
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/PrivacyPolicy/Status?randomKey=1636733200515' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/System/PrivacyPolicy/Status", response="4374692f0e8031763756e2b18bb53576", qop="auth", nc="00000003", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/PrivacyPolicy/Status",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"IsAccepted":	0
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/Security/AccessPolicy?randomKey=1636733210561' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/System/Security/AccessPolicy", response="df36f32152cec1b68d72e0cc738a695b", qop="auth", nc="00000005", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/Security/AccessPolicy",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"FriendlyPassword":	{
		"Enabled":	0
	},
	"MacBind":	{
		"Enabled":	1
	}
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Channel/0/System/Users?randomKey=1636733210608' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Channel/0/System/Users", response="c1342b76951fc67cb66e4567b2075879", qop="auth", nc="00000006", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Channel/0/System/Users",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Number":	1,
	"Users":	[{
			"ID":	0,
			"Name":	"admin",
			"Level":	0
		}]
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/NetWork/HttpAuth?randomKey=1636733210675' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/NetWork/HttpAuth", response="dfc4b7f44a651dc3ca51059a8603a6c2", qop="auth", nc="00000008", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/NetWork/HttpAuth",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Mode":	2
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Channel/0/Demo/Debug/EnhanceMode?randomKey=1636733210724' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Channel/0/Demo/Debug/EnhanceMode", response="22945fee332e8056860b5098ac0dd2ec", qop="auth", nc="00000009", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Channel/0/Demo/Debug/EnhanceMode",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Enabled":	0
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/System/DeviceWorkMode?randomKey=1636733210773' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/System/DeviceWorkMode", response="302df854d527e032286c3e3e246a8ee7", qop="auth", nc="00000010", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/System/DeviceWorkMode",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Mode":	1
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Media/Audio/Input?randomKey=1636733210839' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Media/Audio/Input", response="3678b4f059a6d0c004c8283deb1a0a46", qop="auth", nc="00000012", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Media/Audio/Input",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"IsMute":	1,
	"Type":	0,
	"EncodeFormat":	2,
	"SampleRate":	0,
	"InputGain":	128,
	"NoiseReduction":	{
		"Enabled":	1,
		"Mode":	0,
		"Strength":	0
	},
	"AudioInputNum":	1,
	"AudioInputList":	[{
			"ID":	1,
			"Enabled":	1,
			"Mode":	0
		}],
	"SerialInputNum":	0,
	"SerialIInputList":	[]
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Channels/0/Image/Enhance?randomKey=1636733210905' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Channels/0/Image/Enhance", response="7ccf064e6ffca1e5b3dac34b762d6ad3", qop="auth", nc="00000013", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Channels/0/Image/Enhance",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Brightness":	128,
	"Contrast":	128,
	"Saturation":	128,
	"Sharpness":	128,
	"ImageRotation":	0,
	"2DNoiseReduce":	128,
	"3DNoiseReduce":	128
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Channel/0/Media/Video/Streams/DetailInfos?randomKey=1636733210951' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Channel/0/Media/Video/Streams/DetailInfos", response="8576ba3574fdbf8eae8d4a88b378ad31", qop="auth", nc="00000014", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Channel/0/Media/Video/Streams/DetailInfos",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"Num":	3,
	"VideoStreamInfos":	[{
			"ID":	0,
			"Enabled":	1,
			"VideoEncodeInfo":	{
				"EncodeFormat":	2,
				"Resolution":	{
					"Width":	2560,
					"Height":	1440
				},
				"BitRate":	3072,
				"BitRateType":	1,
				"FrameRate":	25,
				"GOPType":	0,
				"IFrameInterval":	50,
				"ImageQuality":	5,
				"SmoothLevel":	5,
				"SVCMode":	0,
				"SmartEncodeMode":	0
			}
		}, {
			"ID":	1,
			"Enabled":	1,
			"VideoEncodeInfo":	{
				"EncodeFormat":	1,
				"Resolution":	{
					"Width":	640,
					"Height":	360
				},
				"BitRate":	1024,
				"BitRateType":	1,
				"FrameRate":	25,
				"GOPType":	0,
				"IFrameInterval":	50,
				"ImageQuality":	5,
				"SmoothLevel":	5,
				"SVCMode":	0,
				"SmartEncodeMode":	0
			}
		}, {
			"ID":	2,
			"Enabled":	0,
			"VideoEncodeInfo":	{
				"EncodeFormat":	1,
				"Resolution":	{
					"Width":	640,
					"Height":	360
				},
				"BitRate":	128,
				"BitRateType":	1,
				"FrameRate":	25,
				"GOPType":	0,
				"IFrameInterval":	50,
				"ImageQuality":	5,
				"SmoothLevel":	5,
				"SVCMode":	0,
				"SmartEncodeMode":	0
			}
		}]
}
	}
}
```

```sh
curl 'http://192.168.1.41/LAPI/V1.0/Media/Audio/Input?randomKey=1636733211102' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  -H 'Authorization: Digest username="admin", realm="0013e2224685", nonce="5c5529b38e7aad0a33554ece3d32909d", algorithm="MD5", uri="/LAPI/V1.0/Media/Audio/Input", response="4143b8d7da1349c982a038d5b03e34c3", qop="auth", nc="00000015", cnonce="d41d8cd98f00b204e9800998ecf8427e"' \
  -H 'Referer: http://192.168.1.41/page/common/frame.2f83ae40.htm' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: isAutoStartVideo=1; WebLoginHandle=1636733053306' \
  --compressed \
  --insecure
{
"Response": {
	"ResponseURL": "/LAPI/V1.0/Media/Audio/Input",
	"CreatedID": -1,
	"ResponseCode": 0,
 	"SubResponseCode": 0,
 	"ResponseString": "Succeed",
	"StatusCode": 0,
	"StatusString": "Succeed",
	"Data": {
	"IsMute":	1,
	"Type":	0,
	"EncodeFormat":	2,
	"SampleRate":	0,
	"InputGain":	128,
	"NoiseReduction":	{
		"Enabled":	1,
		"Mode":	0,
		"Strength":	0
	},
	"AudioInputNum":	1,
	"AudioInputList":	[{
			"ID":	1,
			"Enabled":	1,
			"Mode":	0
		}],
	"SerialInputNum":	0,
	"SerialIInputList":	[]
}
	}
}
```

## HACK

```sh
curl 'http://192.168.1.41/script/common/device_type.js' \
  -H 'Referer: http://192.168.1.41/page/common/index_ipc.7ac30196.htm?clientIpAddr=192.168.1.44&IsRemote=0&langinfo=1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36' \
  --compressed \
  --insecure
var showDeviceType = "GV-TDR4703";
var showVersionType = 1;
var showProductType = 1;
var showDeviceName = "GV-TDR4703";
var showCustomerCode = "FF";
var showLangList = "1,20,3,4,22,17,6,7,8,5,35,2";
```
