FROM debian:jessie
MAINTAINER Jon Malmaud (malmaud@gmail.com)
RUN mkdir /mods
ADD Make.user /mods/
ADD post.jl /mods/
ENV PATH /julia:$PATH
ENV CXX_VERSION 921b9423f55e7e36aa4a15b6ffad4e5f977204ee
#ENV JULIA_VERSION ed57f9ae5bd14ead09265ac20b310e1b6f11073a
#ENV JULIA_VERSION release-0.4
ENV JULIA_VERSION 1472658275a7d44a94670c64421f83de0bb622f1
ENV GIT_EMAIL malmaud@gmail.com
ENV GIT_NAME Jon Malmaud
CMD ["julia"]
RUN apt-get update && apt-get install -y \
    gcc-4.9 \
    g++-4.9 \
    gfortran \
    git \
    perl \
    m4 \
    wget \
    cmake \
    libssl-dev \
    python2.7 \
    libncurses5-dev \
    libedit-dev \
    bzip2 && \
    git config --global user.email "$GIT_EMAIL" && \
    git config --global user.name "$GIT_NAME" && \
    cd /usr/bin && \
    rm -f gcc g++ && \
    ln -s g++-4.9 g++ && \
    ln -s gcc-4.9 gcc && \
    git clone https://github.com/JuliaLang/julia.git /julia && \
    cd /julia && \
    git checkout $JULIA_VERSION  && \
    cp /mods/Make.user Make.user && \
    make MARCH=x86-64 && \
    /julia/julia /mods/post.jl && \
    rm -rf /mods
