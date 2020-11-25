FROM yinyang/base:cuda10.2

RUN /opt/conda/bin/conda install -yc conda-forge -c pytorch -c fastai \
        # modeling
        xgboost lightgbm catboost mlxtend scikit-learn shap lime \
        # parallel computing
        dask streamz \
        # plotting
        seaborn plotly graphviz pydot python-graphviz kornia fastdot \
        # image processing
        dask-image scikit-image opencv accimage libjpeg-turbo \
        # medical imaging
        pydicom gdcm nibabel \
        # testing
        coverage pytest-mock mock \
        # building
        scikit-build bazel \
        # audio/video
        ffmpeg-python youtube-dl librosa pydub \
        # data format
        pycocotools pyarrow=2 h5py=2.10 \
        # serving
        uvicorn starlette aiohttp omegaconf fire onnx=1.8 \
        # deep learning
        pytorch=1.7 torchvision torchaudio torchtext fastai albumentations nvidia-apex \
        # NLP
        wikipedia elasticsearch nltk \
        # misc
        future munch keyrings.alt \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/pip install --no-cache-dir \
    tensorflow-gpu tensorflow-datasets tensorflow-addons transformers \
    efficientnet-pytorch pretrainedmodels timm nlp pandarallel monai \
    onnx_coreml onnxruntime-gpu \
    knockknock distro libsixel-python

RUN /opt/conda/bin/imageio_download_bin freeimage

CMD ["bash"]
