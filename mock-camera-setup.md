# Mock Camera Setup Jax

## Run mock camera with custom stream/snapshot files

There is a docker container running the mock-camera code on the Guardian itself
using a secondary IP address. To reconfigure/relaunch the mock camera instance,
do this:

First, if you haven’t already, add yourself to the docker group:

```sh
sudo usermod -aG docker $USER
```

Then, re-launch the mock camera container with your files:
(assuming stream.ts and snapshot.png in the current working directory)

```sh
docker rm -f mock-camera-1
docker pull 315020830454.dkr.ecr.us-west-2.amazonaws.com/mock-camera:latest
docker run --rm -dit \
    --name mock-camera-1 \
    --publish 192.168.1.222:80:80 \
    --publish 192.168.1.222:554:554 \
    --user 0:0 \
    --volume $(pwd):/data \
    --workdir /data \
    315020830454.dkr.ecr.us-west-2.amazonaws.com/mock-camera:latest \
    run --mac C4:CC:AC:11:00:02 --stream stream.ts --snapshot snapshot.png
```

## Server Config

The mock camera is intended to run within a Docker network, however, I was able to configure the
Jax machine in a way that allows the use of the mock camera via a secondary IP address.

To get this working, I did the following:

- Installed Docker: https://docs.docker.com/engine/install/ubuntu/
- Configured myself as a docker user:

```sh
sudo usermod -aG docker $USER
```

- Installed and configured the AWS cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- Added a second IP address to the Guardian:

```sh
sudo ifconfig eno2:0 192.168.1.222 netmask 255.255.255.0 up
```

- Bound Nginx to the primary IP (as opposed to all IPs)

```sh
sudo cp /etc/nginx/sites-enabled/guardian.conf /etc/nginx/guardian.conf.bak
sudo sed "s/\(listen *\)80 \(.*\)/\1192.168.1.41:80 \2/g" /etc/nginx/sites-enabled/guardian.conf > /etc/nginx/sites-enabled/guardian.conf.tmp
sudo mv /etc/nginx/sites-enabled/guardian.conf.tmp /etc/nginx/sites-enabled/guardian.conf
sudo service nginx restart
```

- Started the mock-camera using the second IP address

```sh
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 315020830454.dkr.ecr.us-west-2.amazonaws.com
docker pull 315020830454.dkr.ecr.us-west-2.amazonaws.com/mock-camera:latest
docker run --rm -dit \
    --name mock-camera-1 \
    --publish 192.168.1.222:80:80 \
    --publish 192.168.1.222:554:554 \
    315020830454.dkr.ecr.us-west-2.amazonaws.com/mock-camera:latest \
    run --mac C4:CC:AC:11:00:02
```

- Patched the Guardian code with a python3 conversion fix for the mock-camera driver (from master branch)

```sh
cd /opt/safely-you/guardian
git fetch origin
git cherry-pick 733a7343cb05734579192833689e5cd2e2883f5f
```

- Manually updated /opt/safely-you/guardian/settings.json to add Mock to the SENSOR_CONFIGS key.
- Updated Guardian

```sh
cd /opt/safely-you/guardian
. venv/bin/activate
./manage.py task update_network_state
Enabled the camera in Discover dev1
```

## Tear down the custom networking

```sh
docker rm -rf mock-camera-1
sudo ifconfig eno2:0 down
mv /etc/nginx/guardian.conf.bak /etc/nginx/sites-enabled/guardian.conf
sudo service nginx restart
```
