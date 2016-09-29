FROM fluent/fluentd:latest-onbuild
USER root
RUN mkdir /data_log
RUN chmod 777 /data_log
RUN mkdir /data_estemplates
RUN chmod 777 /data_estemplates
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH
RUN apk --no-cache --update add geoip-dev build-base ruby-dev grep sudo curl && \
    sudo -u fluent gem install fluent-plugin-elasticsearch fluent-plugin-record-reformer \
    fluent-plugin-beats fluent-plugin-secure-forward fluent-plugin-record-modifier fluent-plugin-parser \
    fluent-plugin-concat fluent-plugin-rewrite-tag-filter fluent-plugin-forest fluent-plugin-split fluent-plugin-fields-autotype fluent-plugin-grok-parser \
    fluent-plugin-flatten-hash fluent-plugin-xml-parser fluent-plugin-rewrite && \
    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev && rm -rf /var/cache/apk/*
# Copy ES Templates and script to be loaded into ES
COPY estemplates/* /data_estemplates/
COPY load_es_templates.sh /usr/bin/
# Load Additional Configuration Files
COPY configs/* /fluentd/etc/
EXPOSE 24284
#CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
CMD /usr/bin/load_es_templates.sh && fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
