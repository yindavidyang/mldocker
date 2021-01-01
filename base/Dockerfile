FROM nvidia/cuda:11.0-devel-ubuntu20.04

ENV TZ=Asia/Qatar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y apt-utils apt-transport-https apt-file \
    && apt-get clean

RUN apt-get install -y \
        net-tools iputils-ping ftp curl wget gcp axel pv \
        zip p7zip-full p7zip-rar pigz zlib1g-dev \
        ttf-mscorefonts-installer \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose \
    && apt-get autoremove -y \
    && apt-get clean

RUN curl -sLf https://spacevim.org/install.sh | bash

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update \
    && apt-get install elasticsearch \
    && apt-get clean

RUN wget --quiet --show-progress --progress=bar:force:noscroll \
        https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh \
    && bash /miniconda.sh -bfp /usr/local \
    && rm /miniconda.sh \
    && conda config --add channels conda-forge \
    && conda install -y python=3.7 \
    && conda update conda \
    && conda clean -ya

RUN conda install -yc yinyang \
        cudatoolkit=11.0 \
    && conda clean -ya

RUN conda install -yc fastai -c nvidia \
        htop git cmake gdown tmux nano ncdu imagemagick ffmpeg gfortran_linux-64 \
        cython conda-build conda-verify anaconda-client xeus-cling \
        jupyter ipython=7 ipyparallel jupyter_contrib_nbextensions jupyterthemes nbdev=1 \
        cudnn=8 \
    && conda clean -ya

RUN pip install --no-cache-dir \
    gpustat bpytop

RUN ipcluster nbextension enable \
    && jupyter nbextension enable --py latex_envs \
    && jupyter nbextension enable --py jupyter_highlight_selected_word \
    && jupyter nbextension enable collapsible_headings/main \
    && jupyter nbextension enable execute_time/ExecuteTime \
    && jupyter nbextension enable varInspector/main \
    && jupyter nbextension enable codefolding/main \
    && jupyter nbextension enable codefolding/edit \
    && jt -t monokai -f fira -fs 13 -nf ptsans -nfs 11 -N -kl -cursw 5 -cursc r -cellw 95% -T

COPY 00_startup.py /root/.ipython/profile_default/startup/

ENV SHELL /bin/bash
RUN mkdir -p /workspace/share
WORKDIR /workspace

CMD ["bash"]
