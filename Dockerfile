FROM docker.elastic.co/elasticsearch/elasticsearch:7.14.0

ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/elasticsearch.yml
USER elasticsearch
RUN ./bin/elasticsearch-plugin install -s --batch repository-s3
RUN ./bin/elasticsearch-plugin install -s --batch mapper-size