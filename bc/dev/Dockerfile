FROM yinyang/bc

RUN /opt/conda/bin/conda install -yc conda-forge \
        openjdk=11 maven web3 \
    && /opt/conda/bin/conda clean -ya

RUN mkdir /root/jar \
    && cd /root/jar \
    && wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://oss.sonatype.org/service/local/repositories/releases/content/net/consensys/quorum/tessera/tessera-app/20.10.0/tessera-app-20.10.0-app.jar -O /root/jar/tessera-app.jar

RUN cd /root/go/src/github.com/ConsenSys/quorum \
    && make

RUN cd /root \
    && git clone https://github.com/ConsenSys/quorum-examples

RUN /usr/bin/npm install -g solc

ENV GETHDIR=/root/go/src/github.com/ConsenSys/quorum

ENV PATH="${GETHDIR}/build/bin:${PATH}"

CMD ["bash"]
