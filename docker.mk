.PHONY: help install dependencies build clean

NAME := hello-docker-buildkit

export DOCKER_BUILDKIT := 1

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies

dependencies:
	type docker > /dev/null

build:
	docker build -t $(NAME) .

test:
	docker build --rm -t $(NAME) which symfony
	docker build --rm -t $(NAME) which composer

clean:
	docker image rm $(NAME)
