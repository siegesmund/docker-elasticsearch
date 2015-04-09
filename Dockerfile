FROM	java:8	
ENV 	ES_PKG_NAME elasticsearch-1.5.0

# Install Elasticsearch.
RUN	cd / && \
  	wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  	tar xvzf $ES_PKG_NAME.tar.gz && \
  	rm -f $ES_PKG_NAME.tar.gz && \
  	mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME 	["/data"]

# Mount elasticsearch.yml config
ADD 	config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
RUN 	/elasticsearch/bin/plugin -i com.github.richardwilly98.elasticsearch/elasticsearch-river-mongodb/2.0.9
RUN	/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-mapper-attachments/2.4.1 	
RUN 	/elasticsearch/bin/plugin -i elasticsearch/marvel/latest

# Define working directory.
WORKDIR /data

# Define default command.
CMD 	["/elasticsearch/bin/elasticsearch"]

# Expose ports.
EXPOSE 9200
EXPOSE 9300

