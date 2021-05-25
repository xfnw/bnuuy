FROM alpine:latest
RUN apk add x11vnc xvfb supervisor firefox \
&& addgroup bnuuy \
&& adduser  -G bnuuy -s /bin/sh -D bnuuy \
&& rm -rf /apk /tmp/* /var/cache/apk/*
ADD etc /etc
WORKDIR /home/bnuuy
ADD mozilla .mozilla/
RUN chown -R bnuuy:bnuuy .mozilla/
EXPOSE 5900
USER bnuuy
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
