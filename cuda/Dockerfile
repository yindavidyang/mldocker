FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils

RUN apt-get install -y \
        net-tools iputils-ping \
        build-essential cmake git \
        curl wget gcp axel pv \
        zip p7zip-full p7zip-rar pigz zlib1g-dev \
        imagemagick ffmpeg libjpeg-dev libturbojpeg libjpeg8-dev \
        iotop htop tmux ncdu vim \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose

RUN apt-get autoremove -y

CMD ["bash"]
