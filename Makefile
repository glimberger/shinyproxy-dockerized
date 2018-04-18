SHINYPROXY_DIR=shinyproxy
CONTAINER=shinyproxy
NETWORK=sifa-net
FIG=docker-compose
DKR= docker
RUN=$(FIG) run --rm $(CONTAINER)
EXEC=$(FIG) exec $(CONTAINER)

.DEFAULT_GOAL := help
.PHONY: help rebuild shinyproxy build up stop status bash

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'




##
## Project setup
##---------------------------------------------------------------------------

rebuild:        ## Rebuild server and restart
rebuild: stop shinyproxy build up

shinyproxy:     ## Build shinyproxy server
shinyproxy: 
	(cd $(SHINYPROXY_DIR); mvn -U clean install)


build:          ## Build project containers
build:
	$(FIG) build

reup:           ## Restart project containers
reup: stop up

up:             ## Start project containers
up:
	$(FIG) up -d

stop:           ## Remove project containers
stop:
	$(FIG) kill
	$(FIG) rm -v --force

status:         ## Container status
status:
	$(FIG) ps

network:        ## Create network
network:
	$(DKR) network create $(NETWORK)


bash:           ## Bash on container
bash:
	$(EXEC) bash