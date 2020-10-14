# Copyright (c) Dirk Chang <dirk@kooiot.com>
# SPDX-License-Identifier: Apache-2.0
MF_DOCKER_IMAGE_NAME_PREFIX ?= kooiot
PROJECT_NAME ?= freeioe

all:
	docker buildx build --platform linux/amd64 --tag kooiot/skynet --file ./Dockerfile .

.PHONY: all

clean_images:
	docker rmi -f `docker images | grep '<none>' | awk '{print $3}'`

clean_volumns:
	docker volume ls -f dangling=true -q | xargs -r docker volume rm -f

clean_all_volumns: clean_all_containers
	docker volume ls -q | xargs -r docker volume rm -f

clean_all_containers:
	docker container ls -a -q | xargs -r docker container rm -f

cleandocker:
	# Stop all containers (if running)
	docker-compose --project-name $(PROJECT_NAME) -f docker-compose.yml stop
	# Remove containers
	docker ps -f name=$(MF_DOCKER_IMAGE_NAME_PREFIX) -aq | xargs -r docker rm

	# Remove exited containers
	docker ps -f name=$(MF_DOCKER_IMAGE_NAME_PREFIX) -f status=dead -f status=exited -aq | xargs -r docker rm -v

	# Remove unused images
	docker images "$(MF_DOCKER_IMAGE_NAME_PREFIX)\/*" -f dangling=true -q | xargs -r docker rmi

	# Remove old images
	docker images -q "$(MF_DOCKER_IMAGE_NAME_PREFIX)\/*" | xargs -r docker rmi

ifdef pv
	# Remove unused volumes
	docker volume ls -f name=$(MF_DOCKER_IMAGE_NAME_PREFIX) -f dangling=true -q | xargs -r docker volume rm
endif

define docker_push
	for svc in $(SERVICES); do \
		docker push $(MF_DOCKER_IMAGE_NAME_PREFIX)/$$svc:$(1); \
	done
endef

changelog:
	git log $(shell git describe --tags --abbrev=0)..HEAD --pretty=format:"- %s"

latest: dockers
	$(call docker_push,latest)

release:
	$(eval version = $(shell git describe --abbrev=0 --tags))
	git checkout $(version)
	$(MAKE) dockers
	for svc in $(SERVICES); do \
		docker tag $(MF_DOCKER_IMAGE_NAME_PREFIX)/$$svc $(MF_DOCKER_IMAGE_NAME_PREFIX)/$$svc:$(version); \
	done
	$(call docker_push,$(version))

run:
	docker-compose --project-name $(PROJECT_NAME) -f docker-compose.yml up

start:
	docker-compose --project-name $(PROJECT_NAME) -f docker-compose.yml up -d

stop:
	docker-compose --project-name $(PROJECT_NAME) -f docker-compose.yml stop

down:
	docker-compose --project-name $(PROJECT_NAME) -f docker-compose.yml down

define docker_pull
	for svc in $(SERVICES); do \
		docker pull $(MF_DOCKER_IMAGE_NAME_PREFIX)/$$svc:$(1); \
	done
endef

pull_latest:
	$(call docker_pull,latest)

