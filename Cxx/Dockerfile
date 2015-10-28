FROM debian:jessie
MAINTAINER Jon Malmaud (malmaud@gmail.com)
RUN mkdir /mods
ADD Make.user /mods/
ENV PATH /julia:$PATH
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
    cd /usr/bin && \
    ln -s g++-4.9 g++ && \
    git clone https://github.com/JuliaLang/julia.git /julia && \
    cd /julia && \
    git checkout kf/backportllvm-0.4 && \
    cp /mods/Make.user Make.user && \
    make && \
    ./julia -e 'Pkg.clone("https://github.com/Keno/Cxx.jl")' && \
    ./julia -e 'Pkg.build("Cxx")' && \
    cd /julia &&   mv deps/llvm-svn/include /mods && \
    rm -rf usr-staging docs deps/* .git src test examples  && \
    mkdir deps/llvm-svn && \
    mv /mods/include deps/llvm-svn  && \
    rm -rf /mods && \
    apt-get purge -y --auto-remove python2.7 bzip2 perl m4 && \
    rm -rf /var/lib/apt/lists/*
