include .env
export $(shell sed 's/=.*//' .env)

init: init-portainer init-traefik add-ctop-command

init-portainer: init-portainer-dir
init-traefik: init-traefik-dir init-acme-json init-catchall-html

init-portainer-dir:
	@echo portainer: creating config directory
	@mkdir -p ${DOCKER_DATA_DIR}/etc/portainer/

init-traefik-dir:
	@echo traefik: creating config directory
	@mkdir -p ${DOCKER_DATA_DIR}/etc/traefik/

init-acme-json:
	@echo traefik: initializing acme.json
	@touch ${DOCKER_DATA_DIR}/etc/traefik/acme.json
	@chmod 600 ${DOCKER_DATA_DIR}/etc/traefik/acme.json

init-catchall-html:
	@echo traefik: initializing catchall.html
	@mkdir -p ${DOCKER_DATA_DIR}/etc/traefik/
	@curl ${TRAEFIK_CATCHALL_SOURCE} --output ${DOCKER_DATA_DIR}/etc/traefik/catchall.html

add-ctop-command:
	@echo ctop: adding bash script to run ctop inside container
	@echo "#!/bin/bash" > /usr/local/bin/ctop
	@echo "docker run --rm -ti --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest" >> /usr/local/bin/ctop
	@chmod +x /usr/local/bin/ctop
