all:
	docker build -t agrdocker/agr_elasticsearch_env:develop .

push:
	docker push agrdocker/agr_elasticsearch_env:develop

pull:
	docker pull agrdocker/agr_elasticsearch_env:develop

bash:
	docker run -t -i agrdocker/agr_elasticsearch_env:develop bash

run:
	docker run -p 9200:9200 -p 9300:9300 -e "http.host=0.0.0.0" -e "xpack.security.enabled=false" agrdocker/agr_elasticsearch_env:develop
