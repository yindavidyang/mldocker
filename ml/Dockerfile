FROM yinyang/ds

RUN /opt/conda/bin/conda install -y \
      cudatoolkit=10.1 cudnn

RUN /opt/conda/bin/conda install -yc pytorch pytorch torchvision torchaudio
RUN /opt/conda/bin/conda install -y tensorflow-gpu

CMD ["bash"]
