# BUILD_NUM ?= 1
GIT_SHORT_SHA := $(shell git log -1 --format="%h")

build:
	# Build the image.
	docker build --no-cache -t=gsukanto/python_healthcheck .
	docker build -t=gsukanto/python_healthcheck:$(GIT_SHORT_SHA) .

pull:
	# Pull the repository.
	git pull
	# Build the image.
	docker build --no-cache -t=gsukanto/python_healthcheck .
	docker build -t=gsukanto/python_healthcheck:$(GIT_SHORT_SHA) .

run:
	docker run -it -p 3000:3000 gsukanto/python_healthcheck:latest

deploy_local:
	docker run -it -p 80:3000 gsukanto/python_healthcheck:latest
