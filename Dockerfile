FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
#RUN apt-get install -y task-gnome-desktop --no-install-recommends
#RUN apt-get install -y nano less wget --no-install-recommends
RUN apt-get install -y tigervnc-standalone-server xterm nano
RUN apt-get autoremove -y && apt-get clean -y

RUN adduser --disabled-password --gecos "" vncserv

EXPOSE 5901 5900

USER vncserv
WORKDIR /home/vncserv
