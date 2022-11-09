.EXPORT_ALL_VARIABLES:
# GIT_TAG := $(shell git describe --tags)
# BUILD_TAG := $(shell git rev-parse --short HEAD)
PROJECTNAME := $(shell echo "postgresql")
BASEPATH = $(shell echo "$PWD")
DOCKERID = $(shell echo "nuxion")


build:
	docker build -t ${DOCKERID}/${PROJECTNAME}:${TAG} -f dockerfiles/Dockerfile.pg14 . 
push:
	docker push ${DOCKERID}/${PROJECTNAME}:${TAG}


