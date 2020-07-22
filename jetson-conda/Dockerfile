FROM yinyang/jetson-cuda

RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda install -y \
      python=3.6 dataclasses \
      ipyparallel \
      seaborn plotly scikit-learn scikit-image graphviz ffmpeg pydot dask dask-image beautifulsoup4 \
      future munch pyarrow h5py cython cython-blis \
      coverage pytest-mock mock \
      keyrings.alt \
      mlxtend lime \
      tensorboardx \
      ffmpeg-python \
      omegaconf fire \
      libjpeg-turbo python-graphviz pydicom \
      bleach qtpy prometheus_client mistune terminado pyrsistent ipywidgets \
      bottleneck numexpr \
      keras-preprocessing keras-applications 
      
# failed: xgboost catboost tensorboard librosa 

RUN /opt/conda/bin/pip install \
    jupyter \
    youtube-dl \
    lightgbm shap \
    uvicorn starlette aiohttp \
    pycocotools \
    pybind11 futures

RUN cp /usr/lib/python3/dist-packages/cv2.cpython-36m-aarch64-linux-gnu.so /opt/conda/lib/python3.6/site-packages/

CMD ["bash"]