all:
	docker build --no-cache -t agrdocker/agr_elasticsearch_env .

push:
	docker push agrdocker/agr_elasticsearch_env

pull:
	docker pull agrdocker/agr_elasticsearch_env

bash:
	docker run -t -i agrdocker/agr_elasticsearch_env bash

run: docker-run

docker-run:
	docker run -p 9200:9200 -p 9300:9300 -e "http.host=0.0.0.0" -e "transport.host=0.0.0.0" -e "xpack.security.enabled=false" agrdocker/agr_elasticsearch_env

docker-pull-data:
	docker pull agrdocker/agr_es_data_image

docker-run-data:
	docker run -p 9200:9200 -p 9300:9300 -e "http.host=0.0.0.0" -e "transport.host=0.0.0.0" -e "xpack.security.enabled=false" agrdocker/agr_es_data_image
