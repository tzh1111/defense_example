<<<<<<< HEAD
FROM nvidia/cuda:9.0-base
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        pkg-config \
        python3 \
        python3-dev \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py
COPY ./pip.conf /root/.pip/pip.conf
RUN pip install --no-cache-dir numpy pillow
COPY . /competition
WORKDIR /competition
=======
# Dockerfile of Example
# Version 1.0
# Base Images
FROM registry.cn-shanghai.aliyuncs.com/aliseccompetition/tensorflow:1.1.0-devel-gpu
#MAINTAINER
MAINTAINER AlibabaSec

ADD . /competition

WORKDIR /competition
RUN pip --no-cache-dir install  -r requirements.txt
# INSTALL cleverhans foolbox

RUN mkdir ./models
RUN curl -O  'http://alg-misc.cn-hangzhou.oss.aliyun-inc.com/ijcai2019_ai_security_competition/pretrained_models/inception_v1.tar.gz' && tar -xvf inception_v1.tar.gz -C ./models/
>>>>>>> 32ea40f556d079d60e16fbc81495f3a16f457e5b
