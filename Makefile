.PHONY: run

CURRENT_DIR := ${PWD}

build:
	docker build -t cmcarthur/docker-nginx-s3-proxy .

run: build
	docker run -v "$(CURRENT_DIR)":/nginx --publish 10000:80 -itP cmcarthur/docker-nginx-s3-proxy
