# Issue

## Thread

> Ken
>
> here’s what I found.  relates to bringing them online yesterday.
>
> This site originally had nothing but GeoVision cameras.  Now we’re adding GeoVisionTDR cameras.  Upon running update_network_state I get exceptions for the new TDR cameras.  After running it a couple of times I got the cameras to show up in discover.  All seemed well, but I shouldn’t see exceptions at all.
>
> What I think is happening is that every minute the update_network_state task runs and causes an exception, but not a completely fatal exception.  The TDR cameras all restart and somehow this is causing problems.
>
> A good exemplar to focus on is 00.13.E2.27.65.2B / 10.1.139.50 assigned to  guardian-1.oaks.merrill-gardens.safely-you.com .  If this one can be made to work then they all should work fine.

- Room: `23`
- Camera: `00:13:e2:27:65:2b`
- Sensor `00:13:E2:27:65:2B` assigned to guardian `AC:1F:6B:F6:7B:3B` (guardian-1)
- Error: `Failed to retrieve mac address from "10.1.139.68"!`

## One time error from Ken

```
Failed access sensor "10.1.139.73" with default credentials!
Traceback (most recent call last):
  File "/opt/safely-you/guardian/server/guardian/configs/geovision/config.py", line 106, in update_sensor_password
    mac = self.fetch_mac_address(session)
  File "/opt/safely-you/guardian/server/guardian/configs/geovision/config.py", line 50, in fetch_mac_address
    content = self.__request__(session, 'GET', 'LAPI/V1.0/System/DeviceBasicInfo')
  File "/opt/safely-you/guardian/server/guardian/configs/geovision/config.py", line 150, in __request__
    response.raise_for_status()
  File "/opt/safely-you/guardian/venv/lib/python2.7/site-packages/requests/models.py", line 940, in raise_for_status
    raise HTTPError(http_error_msg, response=self)
HTTPError: 401 Client Error: UnAuthorized for url: http://10.1.139.73/LAPI/V1.0/System/DeviceBasicInfo
Failed to retrieve mac address from "10.1.139.73"!
Fingerprinted "10.1.139.73" as a "GeoVisionTDR"
```

## Resolution

Ended up being issues with Guardian hardware
