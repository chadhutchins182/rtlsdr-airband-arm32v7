FROM arm32v7/ubuntu:18.04
LABEL version="1.0" maintainer="Chad Hutchins <chadhutchins182@users.noreply.github.com>"
COPY ${QEMU_BIN} /usr/bin/

#UBUNTU VERSION

ARG VERSION
ARG PLATFORM

RUN apt-get -q update && apt-get -q -y install \
    wget\
    g++ \
    libmp3lame-dev \
    libshout-dev \
    libconfig-dev \
    libconfig++-dev \
    fftw3-dev \
    make \
    librtlsdr-dev 

RUN mkdir /build && \
    wget https://github.com/szpajder/RTLSDR-Airband/archive/$VERSION.tar.gz -O - \
    | tar -xzC /build && \
    cd /build/RTLSDR-Airband-* && \
    make PLATFORM=$PLATFORM && \
    make install && \
    rm -rf \
    /build \
    /usr/bin/qemu-arm-static 

ENV LD_LIBRARY_PATH /opt/vc/lib
CMD ["rtl_airband", "-Fec", "/rtl_airband.conf"]