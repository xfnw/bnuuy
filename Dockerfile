FROM alpine:3.14
RUN apk add git dbus-x11 xorg-server xf86-input-libinput eudev xspice supervisor firefox pulseaudio pulseaudio-alsa \
&& apk add gst-plugins-base gst-plugins-good gst-plugins-bad ttf-freefont ttf-opensans ttf-dejavu ttf-linux-libertine \
&& addgroup bnuuy \
&& adduser  -G bnuuy -s /bin/sh -D bnuuy \
&& rm -rf /apk /tmp/* /var/cache/apk/*
ADD etc /etc
RUN mkdir /tmp/audio_fifo \
&& echo "default-sink = fifo_output" >> /etc/pulse/client.conf \
&& echo "load-module module-null-sink" >> /etc/pulse/default.pa \
&& echo "load-module module-always-sink" >> /etc/pulse/default.pa \
&& echo "load-module module-x11-publish" >> /etc/pulse/default.pa \
&& echo "load-module module-pipe-sink sink_name=fifo_output file=/tmp/audio_fifo/audio.fifo format=s16 rate=44100 channels=2" >> /etc/pulse/default.pa
WORKDIR /home/bnuuy
RUN git clone https://github.com/novnc/websockify websocketify
ADD mozilla .mozilla
ADD spice-html5 spice-html5
RUN chown -R bnuuy:bnuuy .mozilla spice-html5 websocketify /tmp/audio_fifo
EXPOSE 5900 5800
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
