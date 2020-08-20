FROM yinyang/ml

RUN /opt/conda/bin/conda uninstall -y --force pillow pil jpeg libtiff libjpeg-turbo
RUN /opt/conda/bin/conda install -yc conda-forge libjpeg-turbo
RUN /opt/conda/bin/conda uninstall -y --force pillow
RUN CFLAGS="${CFLAGS} -mavx2" /opt/conda/bin/pip install --upgrade --no-cache-dir --force-reinstall --no-binary :all: --compile pillow-simd

CMD ["bash"]
