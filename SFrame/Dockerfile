FROM julia:cxx
MAINTAINER Jon Malmaud (malmaud@gmail.com)
ENV SFRAME_VERSION 19f776dd8480ee37993503673526e107480df45c



RUN apt-get install -y patch zlib1g-dev ccache cmake bzip2 && \
    cd /root && \
    git clone https://github.com/dato-code/SFrame && \
    cd SFrame && \
    git checkout $SFRAME_VERSION && \
    ./configure && \
    cd debug/oss_src/unity && \
    make