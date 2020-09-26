FROM yinyang/ml

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get install apt-transport-https

RUN apt-get update && apt-get install elasticsearch

RUN /opt/conda/bin/conda install -yc conda-forge \
    wikipedia elasticsearch \
    gdcm

CMD ["bash"]
