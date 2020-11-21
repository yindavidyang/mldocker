FROM nvcr.io/nvidia/l4t-base:r32.4.4

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
        imagemagick ffmpeg \
        htop tmux ncdu vim nano ttf-mscorefonts-installer \
        libsixel-bin libsixel-dev libsixel1 \
        docker.io docker-compose \
        python3-opencv \
    && apt-get autoremove -y \
    && apt-get clean

RUN curl -sLf https://spacevim.org/install.sh | bash

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update \
    && apt-get install elasticsearch \
    && apt-get clean    

RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O ~/miniconda.sh \
   && /bin/bash ~/miniconda.sh -b -p /opt/conda \
   && rm ~/miniconda.sh \
   && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
   && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
   && echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda update -y conda \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc yinyang \
        python=3.6 dataclasses cython conda-build conda-verify anaconda-client gdown \
        jupyter_core ipython=7 pyzmq jupyterthemes ipyparallel notebook jupyter_contrib_core ipywidgets nbconvert=5 \
        jupyter_latex_envs jupyter_nbextensions_configurator jupyter_highlight_selected_word jupyter_contrib_nbextensions \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/pip install --no-cache-dir \
    bpytop nbdev

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

RUN cp /usr/lib/python3/dist-packages/cv2.cpython-36m-aarch64-linux-gnu.so /opt/conda/lib/python3.6/site-packages/

CMD ["bash"]

