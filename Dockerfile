FROM ghcr.io/ps2dev/ps2dev:latest
RUN apk add build-base git zip gawk python3 py3-pip bash p7zip py3-yaml flex bison texinfo gmp-dev mpfr-dev mpc1-dev
RUN git clone https://github.com/AKuHAK/ps2toolchain-ppc --depth 1 && \
    cd ps2toolchain-ppc && \
    ./toolchain.sh && \
    cd .. && \
    rm -rf PPC-Monitor
ENV PS2SDKSRC /usr/local/ps2sdk
ENV PATH $PATH:${PS2DEV}/powerpc/bin
RUN git clone https://github.com/ps2dev/ps2sdk /usr/local/ps2sdk/ --depth 1
