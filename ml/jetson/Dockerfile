FROM yinyang/base:jetson

RUN conda install -y \
        # fixing version issue
        scikit-image \
    && conda clean -ya

RUN conda install -yc yinyang \
        cudatoolkit \
        # deep learning
        pytorch torchvision torchaudio torchtext \
        shapely \        
        onnx \
        grpcio=1.32 \
    && conda clean -ya

RUN conda install -yc fastai \
        fastprogress fastscript fastai fastdot \
    && conda clean -ya

RUN conda install -y \
        albumentations \
        h5py=2.10 \
    && conda clean -ya

RUN conda install -y \
        # image processing
        dask-image libjpeg-turbo \
    && conda clean -ya

RUN conda install -y \
        # plotting
        seaborn plotly \
    && conda clean -ya

RUN conda install -yc yinyang \
        # medical imaging
        pydicom gdcm nibabel \
    && conda clean -ya

RUN conda install -y \
        # modeling
        lightgbm mlxtend shap lime \
        # parallel computing
        streamz \
    && conda clean -ya

RUN conda install -y \
        # audio/video
        ffmpeg-python youtube-dl pydub \
        # NLP
        wikipedia elasticsearch nltk \
    && conda clean -ya

RUN conda install -y \
        # testing
        coverage pytest-mock mock \
        # building
        scikit-build \
        # data format
        pycocotools pyarrow=2 \
    && conda clean -ya

RUN conda install -y \
        # serving
        omegaconf fire \
        # misc
        future munch keyrings.alt \
    && conda clean -ya

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://nvidia.box.com/shared/static/ukszbm1iklzymrt54mgxbzjfzunq7i9t.whl -O onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl \
    && pip install --no-cache-dir onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl  \
    && rm onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl

RUN pip install --no-cache-dir --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow

RUN pip install --no-cache-dir \
    tensorflow-datasets transformers

RUN pip install --no-cache-dir \
    efficientnet-pytorch pretrainedmodels timm nlp pandarallel monai tsai

RUN pip install --no-cache-dir \
    onnx_coreml

RUN pip install --no-cache-dir \
    knockknock distro libsixel-python

RUN pip install --no-cache-dir \
    youtube-dl shapely librosa xgboost kornia \
    uvicorn starlette aiohttp futures

RUN imageio_download_bin freeimage

ENV FASTAI_HOME=/workspace/share/fastai
ENV TORCH_HOME=/workspace/share/torch
ENV KERAS_HOME=/workspace/share/keras
ENV NLTK_DATA=/workspace/share/nltk_data

CMD ["bash"]