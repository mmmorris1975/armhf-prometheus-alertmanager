FROM armhf-prometheus-busybox:latest
MAINTAINER Mike Morris

COPY alertmanager  /bin/alertmanager
COPY simple.yml    /etc/alertmanager/config.yml

EXPOSE     9093
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "-config.file=/etc/alertmanager/config.yml", \
"-storage.path=/alertmanager" ]
