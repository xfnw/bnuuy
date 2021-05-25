FROM alpine:latest
RUN apk add x11vnc xvfb supervisor firefox \
&& addgroup bnuuy \
&& adduser  -G bnuuy -s /bin/sh -D bnuuy \
&& rm -rf /apk /tmp/* /var/cache/apk/*
ADD etc /etc
WORKDIR /home/bnuuy
EXPOSE 5900 5901
USER bnuuy
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
