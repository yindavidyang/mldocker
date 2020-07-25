FROM yinyang/conda

RUN /opt/conda/bin/conda install -y \
      tensorflow-gpu

RUN /opt/conda/bin/pip install -qq \
      gpustat \
      knockknock

CMD ["bash"]
