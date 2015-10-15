FROM debian:jessie
MAINTAINER Jon Malmaud (malmaud@gmail.com)
RUN mkdir /mods
ADD Make.user deps_Makefile.patch lldb-python.patch /mods/
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
    bzip2 && cd / &&  \
git clone https://github.com/JuliaLang/julia.git julia && cd /usr/bin &&  \
rm -f gcc g++ && \
ln -s g++-4.9 g++ && \
ln -s gcc-4.9 gcc && \
cd /julia && \
cp /mods/Make.user Make.user && \
cp /mods/deps_Makefile.patch deps_Makefile.patch && \
cp /mods/lldb-python.patch deps/lldb-python.patch && \
patch -p1 < deps_Makefile.patch && \
make  -j4 && \
julia -e 'Pkg.clone("https://github.com/Keno/Cxx.jl"); Pkg.build("Cxx"); using Cxx' && \
rm -rf /mods && \
apt-get purge -y --auto-remove gfortran python2.7 bzip2 perl m4 && \
rm -rf /var/lib/apt/lists/*

