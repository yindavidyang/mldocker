FROM nvidia/cuda:11.1-devel-ubuntu20.04

ENV TZ=Asia/Qatar

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils apt-transport-https

RUN apt-get install -y \
        net-tools iputils-ping ftp \
        build-essential cmake git libncurses5-dev libncursesw5-dev \
        curl wget gcp axel pv \
        zip p7zip-full p7zip-rar pigz zlib1g-dev \
        imagemagick ffmpeg libjpeg-dev libturbojpeg libjpeg8-dev \
        iotop htop tmux ncdu vim nano \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get update && apt-get install elasticsearch

RUN apt-get autoremove -y

RUN apt-get clean

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda install -yc conda-forge \
    python=3.7 \
    jupyter ipyparallel jupyter_contrib_nbextensions nb_conda

RUN /opt/conda/bin/ipcluster nbextension enable

RUN /opt/conda/bin/pip install --no-cache-dir \
    gpustat

RUN /opt/conda/bin/conda clean -ya

RUN git clone https://github.com/Syllo/nvtop.git

RUN mkdir -p nvtop/build && cd nvtop/build && cmake .. && make && make install

CMD ["bash"]
