from debian:buster

COPY ./configs /root/.ucloud
COPY ./wrap-run.sh /root

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git build-essential wget
RUN wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
RUN echo 'export GOROOT=/usr/local/go' | tee -a /etc/profile
RUN echo 'export PATH=$PATH:/usr/local/go/bin' | tee -a /etc/profile
RUN git clone --depth=1 https://github.com/ucloud/ucloud-cli.git
RUN (. /etc/profile; cd ucloud-cli; make install)

CMD /root/wrap-run.sh
