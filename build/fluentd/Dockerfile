FROM fluent/fluentd:v0.12.28-onbuild
USER root
RUN mkdir /data_log
RUN chmod 777 /data_log
RUN mkdir /data_estemplates
RUN chmod 777 /data_estemplates
RUN mkdir /fluentd_buffer
RUN chmod 777 /fluentd_buffer
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH
# Grab IP Database
WORKDIR /data
RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
RUN gunzip GeoLiteCity.dat.gz
# DISABLED fluent-plugin-flatten-hash
RUN apk --no-cache --update add build-base ruby-dev grep sudo curl geoip-dev && \
    sudo -u fluent gem install  \
     fluent-plugin-elasticsearch \
     fluent-plugin-record-reformer \
     fluent-plugin-secure-forward \
     fluent-plugin-geoip-filter \
     fluent-plugin-record-modifier \
     fluent-plugin-parser \
     fluent-plugin-rewrite-tag-filter \
     fluent-plugin-forest \
     fluent-plugin-fields-autotype \
     fluent-plugin-rewrite \
     strptime \
     && rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev && rm -rf /var/cache/apk/*
# Copy ES Templates and script to be loaded into ES
COPY estemplates/* /data_estemplates/
COPY load_es_templates.sh /usr/bin/
# Load Additional Configuration Files
COPY configs/* /fluentd/etc/
EXPOSE 24284
#CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
CMD /usr/bin/load_es_templates.sh && fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
