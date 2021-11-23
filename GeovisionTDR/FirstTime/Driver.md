# Driver

```sh
$ curl -s http://192.168.1.41/LAPI/V1.0/System/DeviceBasicInfo | jq
{
  "Response": {
    "ResponseURL": "/LAPI/V1.0/System/DeviceBasicInfo",
    "ResponseCode": 3,
    "SubResponseCode": 0,
    "ResponseString": "Not Authorized",
    "StatusCode": 401,
    "StatusString": "Unauthorized",
    "Data": "null"
  }
}
```
curl -s http://192.168.1.41/LAPI/V1.0/System/DeviceBasicInfo --digest -u admin:admin

curl -v  'https://jigsaw.w3.org/HTTP/Digest/'


curl -s http://192.168.1.41/LAPI/V1.0/System/DeviceBasicInfo --digest -u admin:password123! | jq
{
