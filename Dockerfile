FROM centos:7
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel wget

USER root 
RUN adduser esuser
RUN usermod -aG wheel esuser

RUN wget -O /home/esuser/elasticsearch-6.2.4.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz
WORKDIR /home/esuser/
RUN tar -xvf elasticsearch-6.2.4.tar.gz
RUN rm elasticsearch-6.2.4.tar.gz

COPY elasticsearch.yml /home/esuser/elasticsearch-6.2.4/config/elasticsearch.yml
COPY logging.yml /home/esuser/elasticsearch-6.2.4/config/logging.yml
COPY start.sh /home/esuser/start.sh

ENV ES_HOME /home/esuser/elasticsearch-6.2.4
ENV ES_PATH_CONF "$ES_HOME/config"
ENV PATH "$PATH:$ES_HOME/bin"

WORKDIR /home/esuser
RUN chmod -R 777 /home/esuser/elasticsearch-6.2.4
RUN ["chmod", "+x", "start.sh"]
USER esuser
CMD ["/home/esuser/start.sh"]

EXPOSE 9200 9300