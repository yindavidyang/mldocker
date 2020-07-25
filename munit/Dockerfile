FROM yinyang/conda

RUN /opt/conda/bin/conda install -yc pytorch cuda92 pytorch=0.4.1 torchvision cudatoolkit=9.2

RUN git clone https://github.com/NVlabs/MUNIT.git

CMD ["bash"]
