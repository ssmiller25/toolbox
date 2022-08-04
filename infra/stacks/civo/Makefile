# Same as terraform:light, but tiing to specific 
CONTAINER?=hashicorp/terraform:1.2.6

DOCKER_CMD=docker run --rm -it -e CIVO_TOKEN -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -v $$(pwd):/workdir $(CONTAINER) -chdir=/workdir

.PHONY:init
init:
	$(DOCKER_CMD) init

.PHONY:fmt
fmt:
	$(DOCKER_CMD) fmt ./


.PHONY:plan
plan:
	$(DOCKER_CMD) plan	

.PHONY:apply
apply:
	$(DOCKER_CMD) apply	

.PHONY:apply-refresh
apply-refresh:
	$(DOCKER_CMD) apply -refresh-only

.PHONY:alias
alias:
	@echo alias tmake=\"$(DOCKER_CMD)\"