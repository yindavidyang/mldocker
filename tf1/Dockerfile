FROM yinyang/conda

RUN /opt/conda/bin/conda install -y \
      tensorflow-gpu=1.15

RUN /opt/conda/bin/pip install -qq \
      gpustat \
      knockknock

CMD ["bash"]
