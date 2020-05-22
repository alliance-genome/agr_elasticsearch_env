FROM docker.elastic.co/elasticsearch/elasticsearch:7.7.0

#ADD elasticsearch.yml /usr/share/elasticsearch/config/
#USER root
#RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch
RUN ./bin/elasticsearch-plugin install -s --batch repository-s3
