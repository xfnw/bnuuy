FROM alpine:latest
RUN apk add dbus-x11 xorg-server xf86-input-libinput eudev xspice supervisor firefox pulseaudio pulseaudio-alsa alsa-plugins-pulse\
&& addgroup bnuuy \
&& adduser  -G bnuuy -s /bin/sh -D bnuuy \
&& rm -rf /apk /tmp/* /var/cache/apk/*
ADD etc /etc
RUN mkdir /tmp/audio_fifo\
&& echo "default-sink = fifo_output" >> /etc/pulse/client.conf \
&& echo "load-module module-null-sink" >> /etc/pulse/default.pa \
&& echo "load-module module-always-sink" >> /etc/pulse/default.pa \
&& echo "load-module module-x11-publish" >> /etc/pulse/default.pa \
&& echo "load-module module-pipe-sink sink_name=fifo_output file=/tmp/audio_fifo/audio.fifo format=s16 rate=44100 channels=2" >> /etc/pulse/default.pa
WORKDIR /home/bnuuy
ADD mozilla .mozilla/
RUN chown -R bnuuy:bnuuy .mozilla/ /tmp/audio_fifo
EXPOSE 5900
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
