#!/bin/sh -e

if [ $(docker ps -a -f "name=/docker-deb-vnc$" -q) ]; then
  docker rm -f docker-deb-vnc
fi

docker build -t darkmagus/docker-deb-vnc .

docker run -ti \
  -p 5900-5901:5900-5901 \
  -e USER="vncserv" \
  --name="docker-deb-vnc" \
  darkmagus/docker-deb-vnc \
  vncserver :1 -fg -xstartup /usr/bin/xterm -verbose -SecurityTypes None -localhost no --I-KNOW-THIS-IS-INSECURE

