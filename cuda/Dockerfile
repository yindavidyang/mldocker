FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils

RUN apt-get install -y \
        net-tools iputils-ping \
        build-essential cmake git \
        curl wget gcp axel \
        vim \
        zip p7zip-full p7zip-rar pigz\
        imagemagick ffmpeg libturbojpeg \
        iotop htop tmux ncdu \
        libsixel-bin libsixel-dev libsixel1

CMD ["bash"]
