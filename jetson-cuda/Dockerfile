FROM nvcr.io/nvidia/l4t-base:r32.4.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils

RUN apt-get install -y \
        net-tools iputils-ping \
        build-essential cmake git \
        curl wget gcp axel \
        zip p7zip-full p7zip-rar pigz zlib1g-dev\
        imagemagick ffmpeg libjpeg-dev libturbojpeg libjpeg8-dev \
        iotop htop tmux ncdu vim \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose \
        libopenblas-dev gfortran liblapack-dev libblas-dev \
        libopenmpi2 openmpi-bin openmpi-common \
        sox libsox-dev libsox-fmt-all \
        libhdf5-serial-dev hdf5-tools libhdf5-dev \
        python3-opencv

RUN apt-get autoremove -y

CMD ["bash"]
