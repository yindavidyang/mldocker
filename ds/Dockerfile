FROM yinyang/basic

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda install -y \
      jupyter ipyparallel \
      seaborn plotly scikit-learn scikit-image graphviz ffmpeg pydot dask dask-image beautifulsoup4 tensorboard opencv \
      future munch pyarrow h5py cython \
      coverage pytest-mock mock \
      keyrings.alt

RUN /opt/conda/bin/conda install -yc conda-forge \
      xgboost lightgbm catboost mlxtend shap lime \
      uvicorn starlette aiohttp \
      tensorboardx cython-blis libjpeg-turbo jupyter_contrib_nbextensions \
      ffmpeg-python youtube-dl librosa \
      omegaconf fire python-graphviz pydicom pycocotools

RUN /opt/conda/bin/ipcluster nbextension enable

CMD ["bash"]
