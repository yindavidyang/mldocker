FROM yinyang/conda

RUN /opt/conda/bin/conda install -y \
      tensorflow-gpu

RUN /opt/conda/bin/pip install \
      gpustat \
      knockknock

CMD ["bash"]
