FROM nvidia/cuda:11.0-devel-ubuntu20.04

ENV TZ=Asia/Qatar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y apt-utils apt-transport-https apt-file \
    && apt-get clean

RUN apt-get install -y \
        net-tools iputils-ping ftp build-essential cmake git curl wget gcp axel pv \
        zip p7zip-full p7zip-rar pigz zlib1g-dev \
        imagemagick ffmpeg htop tmux ncdu vim nano ttf-mscorefonts-installer \
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

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda \
    && rm ~/miniconda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda update -yc conda-forge conda \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc conda-forge -c yinyang \
        cudatoolkit=11.0 \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc conda-forge -c fastai -c nvidia \
        python=3.7 cython conda-build conda-verify anaconda-client gdown \
        jupyter ipython=7 ipyparallel jupyter_contrib_nbextensions jupyterthemes nbdev=1 \
        cudnn=8 \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/pip install --no-cache-dir \
    gpustat bpytop

RUN /opt/conda/bin/ipcluster nbextension enable \
    && /opt/conda/bin/jupyter nbextension enable --py latex_envs \
    && /opt/conda/bin/jupyter nbextension enable --py jupyter_highlight_selected_word \
    && /opt/conda/bin/jupyter nbextension enable collapsible_headings/main \
    && /opt/conda/bin/jupyter nbextension enable execute_time/ExecuteTime \
    && /opt/conda/bin/jupyter nbextension enable varInspector/main \
    && /opt/conda/bin/jupyter nbextension enable codefolding/main \
    && /opt/conda/bin/jupyter nbextension enable codefolding/edit \
    && /opt/conda/bin/jt -t monokai -f fira -fs 13 -nf ptsans -nfs 11 -N -kl -cursw 5 -cursc r -cellw 95% -T

COPY 00_startup.py /root/.ipython/profile_default/startup/

CMD ["bash"]
