FROM debian:jessie
MAINTAINER Jon Malmaud (malmaud@gmail.com)
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
    python2.7 \
    ncurses-dev \
    libedit-dev
EXPOSE 8000
VOLUME /data
RUN git clone https://github.com/JuliaLang/julia.git
WORKDIR /julia
RUN git checkout 930e6b55327c6caf60d0eae4d71ffdf43e55fbae
ADD Make.user Make.user
RUN make -j4
ENTRYPOINT ["/julia/julia"]
