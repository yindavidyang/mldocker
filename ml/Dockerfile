FROM yinyang/base

RUN conda install -y\
        # fixing version issue
        scikit-image \
    && conda clean -ya

RUN conda install -yc pytorch -c fastai \
        # deep learning
        pytorch torchvision torchaudio torchtext fastai albumentations nvidia-apex onnx \
    && conda clean -ya

RUN conda install -y \
        # image processing
        dask-image accimage libjpeg-turbo kornia \
    && conda clean -ya

RUN conda install -y \
        # plotting
        seaborn plotly \
    && conda clean -ya

RUN conda install -y \
        # medical imaging
        pydicom gdcm nibabel \
    && conda clean -ya
    
RUN conda install -y \
        # modeling
        xgboost lightgbm catboost mlxtend shap lime \
        # parallel computing
        streamz \
    && conda clean -ya

RUN conda install -y \
        # audio/video
        ffmpeg-python youtube-dl librosa pydub \
        # NLP
        wikipedia elasticsearch nltk \
    && conda clean -ya

RUN conda install -y \
        # testing
        coverage pytest-mock mock \
        # building
        scikit-build bazel ninja \
        # data format
        pycocotools pyarrow=2 \
    && conda clean -ya

RUN conda install -y \
        # serving
        uvicorn starlette aiohttp omegaconf fire \
        # misc
        future munch keyrings.alt \
    && conda clean -ya

RUN pip install --no-cache-dir \
    tensorflow-gpu tensorflow-datasets tensorflow-addons transformers

RUN pip install --no-cache-dir \
    efficientnet-pytorch pretrainedmodels timm nlp pandarallel monai tsai

RUN pip install --no-cache-dir \
    onnx_coreml onnxruntime-gpu
    
RUN pip install --no-cache-dir \    
    knockknock distro libsixel-python \
    fastdot fbprophet

RUN imageio_download_bin freeimage

ENV FASTAI_HOME=/workspace/share/fastai
ENV TORCH_HOME=/workspace/share/torch
ENV KERAS_HOME=/workspace/share/keras
ENV NLTK_DATA=/workspace/share/nltk_data

CMD ["bash"]
