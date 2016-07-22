#!/bin/bash
WD = $(shell pwd)

create_ami:
	version=`docker run -v $(WD):/src mashape/semver semver bump patch`
	eval `ssh-agent -s` && \
  #chmod 500 ~/.ssh/id_rsa && \
  #ssh-add ~/.ssh/id_rsa && \
	git add . && \
	git commit -am "created new AMI"
	git tag -a $$version -m "created new AMI"
	git push origin master --tags
