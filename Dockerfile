FROM debian:jessie
MAINTAINER Jon Malmaud
WORKDIR /
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    git \
    gfortran \
    perl \
    m4 \
    wget \
    cmake \
    libssl-dev \
    python2.7
EXPOSE 8000
VOLUME /data
RUN git clone https://github.com/JuliaLang/julia.git
WORKDIR /julia
ADD https://malmaud.github.io/files/Make.user /julia/Make.user
RUN make
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENTRYPOINT ["/julia/julia"]
