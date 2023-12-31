FROM ubuntu:20.04
LABEL maintainer="cookun <cookun@sechelper.com>"

RUN apt update\
    && apt install -y libtesseract-dev libleptonica-dev wget make sudo

WORKDIR ${HOME}

RUN wget https://go.dev/dl/go1.20.7.linux-amd64.tar.gz -O go1.20.7.linux-amd64.tar.gz
RUN tar -zxf go1.20.7.linux-amd64.tar.gz && rm -f go1.20.7.linux-amd64.tar.gz

ENV GO111MODULE=on
ENV GOPATH=${HOME}/go
ENV PATH=${PATH}:${GOPATH}/bin

RUN wget https://github.com/hybridgroup/gocv/archive/refs/tags/v0.34.0.tar.gz
RUN tar -zxf v0.34.0.tar.gz && cd gocv-0.34.0 && make install
RUN rm -rf ${HOME}/v0.34.0.tar.gz ${HOME}/gocv-0.34.0

