from ubuntu:14.04
RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs python make gcc g++
#RUN npm install -g Haraka
ENV HOME /root
RUN mkdir /root/haraka
WORKDIR /root/haraka
RUN openssl req     -new     -newkey rsa:4096     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"     -keyout /root/haraka/tls_key.pem     -out /root/haraka/tls_cert.pem
ADD .bashrc /root/.bashrc
