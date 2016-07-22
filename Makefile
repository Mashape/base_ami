#!/bin/bash
WD = $(shell pwd)

create_ami:
	docker run -i --rm \
		-e "home=$(WD)" \
		-v $(WD):$(WD) \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		mashape/packerbuilder packer validate $(WD)/packer.json
	$(eval VERSION=`docker run -v $(WD):/src mashape/semver semver bump patch --pretend`)
	@docker run -i --rm \
		-v $(WD):$(WD) \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ~/.docker:/root/.docker \
		-e "home=$(WD)" \
		-e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
		-e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
		-e "VERSION=${VERSION}" \
		mashape/packerbuilder packer -machine-readable build $(WD)/packer.json | tee build.log && \
