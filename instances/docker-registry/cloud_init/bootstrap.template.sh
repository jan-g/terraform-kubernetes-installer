#!/bin/bash -x

# Turn off SELinux
setenforce 0

# Set working dir
cd /home/opc

# enable ol7 addons
yum-config-manager --disable ol7_UEKR3
yum-config-manager --enable ol7_addons ol7_latest ol7_UEKR4 ol7_optional ol7_optional_latest

# Install Docker
until yum -y install docker-engine-${docker_ver}; do sleep 1 && echo -n "."; done

# Configure docker
mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<-EOF
{ "insecure-registries": ["docker-registry:5000"] }
EOF

# Start Docker
systemctl daemon-reload
systemctl restart docker

docker info

###################
# Drop firewall rules
iptables -F

###################
# Docker registry

docker run -d \
	-p 5000:5000 \
	--net=host \
        --name=registry \
        --restart=always \
        registry:2
