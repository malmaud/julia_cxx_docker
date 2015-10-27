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
    bzip2
RUN git clone https://github.com/JuliaLang/julia.git /julia
WORKDIR /julia
RUN git checkout kf/backportllvm-.4
RUN cp /mods/Make.user Make.user
RUN make
RUN rm -rf usr-staging
RUN rm -rf docs
RUN mv deps/llvm-svn/build_Release+Asserts /mods && \
    rm -rf deps/* &&  \
    mv mkdir deps/llvm-svn && \
    mv /mods/build_Release+Asserts  deps/llvm-svn
RUN ./julia -e 'Pkg.clone("https://github.com/Keno/Cxx.jl")'
RUN ./julia -e 'Pkg.build("Cxx")'
RUN apt-get purge -y --auto-remove python2.7 bzip2 perl m4
RUN rm -rf /var/lib/apt/lists/*
