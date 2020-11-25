FROM yinyang/base:cpu

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://golang.org/dl/go1.15.5.linux-amd64.tar.gz -O go.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz
    
RUN GO111MODULE=on /usr/local/go/bin/go get github.com/gopherdata/gophernotes \
    && mkdir -p ~/.local/share/jupyter/kernels/gophernotes \
    && cd ~/.local/share/jupyter/kernels/gophernotes \
    && cp "$(/usr/local/go/bin/go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.1/kernel/*  "." \
    && chmod +w ./kernel.json \
    && sed "s|gophernotes|$(/usr/local/go/bin/go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://sh.rustup.rs -O rust_init.sh \
    && sh rust_init.sh -y \
    && rm rust_init.sh \
    && echo "source $HOME/.cargo/env" >> ~/.bashrc

RUN ~/.cargo/bin/rustup component add rust-src \
    && ~/.cargo/bin/cargo install evcxr_jupyter \
    && ~/.cargo/bin/evcxr_jupyter --install

RUN /opt/conda/bin/conda install -yc conda-forge \
        xeus-cling \
    && /opt/conda/bin/conda clean -ya

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

RUN /usr/local/go/bin/go get -v github.com/ConsenSys/quorum

RUN ~/.cargo/bin/cargo install --git https://github.com/openethereum/openethereum.git parity-ethereum

ENV PATH="/usr/local/go/bin:${PATH}"

CMD ["bash"]
