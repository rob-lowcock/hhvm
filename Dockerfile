FROM ubuntu:14.04

RUN sudo apt-get update
RUN sudo apt-get upgrade -y

# Install HHVM

RUN sudo apt-get install software-properties-common -y
RUN sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN sudo add-apt-repository 'deb http://dl.hhvm.com/ubuntu trusty main'
RUN sudo apt-get update
RUN sudo apt-get install hhvm -y

VOLUME /var/www/html

CMD ["/usr/local/bin/hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000"]
