from ubuntu:14.04
RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs python make gcc g++ curl
ENV HOME /root
WORKDIR /root/
ADD .bashrc /root/.bashrc
