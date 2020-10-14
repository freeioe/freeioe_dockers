# Copyright (c) Dirk Chang <dirk@kooiot.com>
# SPDX-License-Identifier: Apache-2.0
MF_DOCKER_IMAGE_NAME_PREFIX ?= kooiot

all:
	docker build --tag ${MF_DOCKER_IMAGE_NAME_PREFIX}/freeioe_toolchains --file ./Dockerfile .

.PHONY: all

define docker_push
	docker push $(MF_DOCKER_IMAGE_NAME_PREFIX)/freeioe_toolchains:$(1);
endef

latest: dockers
	$(call docker_push,latest)
