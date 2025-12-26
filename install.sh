#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2

if [[ "$EUID" != "0" ]]; then
	echo "ERROR: Debes ser root."
	exit 1
fi

if [[ $(dpkg --get-selections | grep -w "docker-compose-plugin" | awk '{print $1}' | head -1) = docker-compose-plugin ]]; then
	docker system prune -af
	chmod -R 777 init
	docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
	chmod -R 777 n8n
	echo "Finalizado."
else
	echo "ERROR: Docker NO esta instalado."
	quienh=$(ls -l /home | awk '{print $9}' | grep -v "lost+found" | tail -n +2)
	apt -y remove --purge docker.io docker-compose docker-doc podman-docker docker-ctop
	echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7EA0A9C3F273FCD8
	apt update -qq
	apt -y install docker-ce-rootless-extras docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin
	groupadd docker
	for j in ${quienh[@]}; do
		usermod -aG docker $j
	done
	echo "Docker instalado con exito, se recomienda reiniciar."
fi
exit 0
