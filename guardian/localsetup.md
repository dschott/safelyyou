# Hackery



```bash
ssh safelyyou@192.168.8.4
```

# Docker Engine

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
```

## Docker Compose

https://docs.docker.com/compose/cli-command/

```bash
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
```

brew install esolitos/ipa/sshpass
ansible-playbook -u safelyyou init.yml -i inventory/production --limit=$GUARDIAN --ask-pass --ask-become-pass --vault-password-file=./production.vault
ansible-playbook -u safelyyou init.yml -i inventory.local --limit=$GUARDIAN --ask-pass --ask-become-pass --vault-password-file=./production.vault
