FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils apt-transport-https

RUN apt-get install -y \
        net-tools iputils-ping ftp \
        build-essential cmake git \
        curl wget gcp axel pv \
        zip p7zip-full p7zip-rar pigz zlib1g-dev \
        imagemagick ffmpeg libjpeg-dev libturbojpeg libjpeg8-dev \
        iotop htop tmux ncdu vim \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get update && apt-get install elasticsearch

RUN apt-get autoremove -y

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda install -yc conda-forge \
    python=3.7 \
    jupyter ipyparallel jupyter_contrib_nbextensions

RUN /opt/conda/bin/ipcluster nbextension enable

RUN /opt/conda/bin/pip install --no-cache-dir \
    gpustat

RUN apt-get clean
RUN /opt/conda/bin/conda clean -ya

CMD ["bash"]
