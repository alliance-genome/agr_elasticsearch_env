REG := 100225593120.dkr.ecr.us-east-1.amazonaws.com

registry-docker-login:
ifneq ($(shell echo ${REG} | egrep "ecr\..+\.amazonaws\.com"),)
	@$(eval DOCKER_LOGIN_CMD=aws)
ifneq (${AWS_PROFILE},)
	@$(eval DOCKER_LOGIN_CMD=${DOCKER_LOGIN_CMD} --profile ${AWS_PROFILE})
endif
	@$(eval DOCKER_LOGIN_CMD=${DOCKER_LOGIN_CMD} ecr get-login-password | docker login -u AWS --password-stdin https://${REG})
	${DOCKER_LOGIN_CMD}
endif

all:
	docker build --no-cache -t ${REG}/agr_elasticsearch_env .

push: registry-docker-login
	docker push ${REG}/agr_elasticsearch_env

pull: registry-docker-login
	docker pull ${REG}/agr_elasticsearch_env

bash:
	docker run -t -i ${REG}/agr_elasticsearch_env bash

run: docker-run

docker-run:
	docker run -p 9200:9200 -p 9300:9300 -e "http.host=0.0.0.0" -e "transport.host=0.0.0.0" -e "xpack.security.enabled=false" ${REG}/agr_elasticsearch_env
