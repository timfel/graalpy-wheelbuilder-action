FROM oraclelinux:8

ENV LANG=en_US.UTF-8

RUN dnf install -y \
        oracle-software-release-el8 \
        oracle-epel-release-el8 \
        oraclelinux-developer-release-el8 \
        oracle-instantclient-release-el8 \
        mysql-release-el8 \
    && dnf config-manager --add-repo https://yum.oracle.com/repo/OracleLinux/OL8/codeready/builder/x86_64 \
    && dnf module install -y nodejs:16-epel/default \
    && dnf --setopt=obsoletes=0 install -y \
        atlas \
        autoconf \
        automake \
        bcftools \
        bzip2 \
        bzip2-devel \
        cairo-devel \
        cairo-gobject-devel \
        clang-devel-14.0.6 \
        cmake \
        curl \
        dumb-init \
        ed \
        figlet \
        file \
        fish \
        flac-devel \
        fluidsynth-devel \
        freetype-devel \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        gcc-toolset-9 \
        gcc-toolset-12 \
        gdbm-devel \
        geos-devel \
        ghostscript \
        git \
        git-daemon \
        git-lfs \
        gobject-introspection-devel \
        graphviz-devel \
        gtk3-devel \
        hdf5-devel \
        htslib-tools \
        iproute \
        iptables \
        java-11-openjdk-devel.x86_64 \
        java-11-openjdk-jmods.x86_64 \
        jq \
        krb5-server \
        krb5-workstation \
        lcms2-devel \
        libX11-devel \
        libXext-devel \
        libarchive-devel \
        libatomic \
        libcurl-devel \
        libffi-devel \
        libglvnd-egl \
        libglvnd-glx \
        libimagequant-devel \
        libjpeg-turbo-devel \
        libmemcached-devel \
        libmodplug-devel \
        libraqm-devel \
        libtiff-devel \
        libtool \
        libwebp-devel \
        libxcb-devel \
        libxkbcommon \
        libxml2-devel \
        libxslt-devel \
        libyaml-devel \
        llvm-devel-14.0.6 \
        llvm-toolset-14.0.6 \
        make \
        mercurial \
        mpich-devel \
        mysql-devel \
        mysql-server \
        ncurses-devel \
        netcdf-devel \
        nmap-ncat \
        openblas-devel \
        openblas-static \
        openjpeg2-devel \
        openmpi \
        openmpi-devel \
        openssl \
        openssl-devel \
        opusfile-devel \
        oracle-instantclient-basic \
        pandoc \
        patch \
        patchelf \
        portaudio-devel \
        portmidi-devel \
        postgresql-contrib \
        postgresql-devel \
        postgresql-odbc \
        postgresql-server \
        python3 \
        python3-oci-cli \
        qt5-qtbase-devel \
        qt5-qtbase-gui \
        qt5-qtbase-private-devel \
        readline-devel \
        redis \
        rsync \
        samtools \
        sqlite-devel \
        tar \
        tcsh \
        tesseract \
        time \
        tk-devel \
        tzdata-java \
        unixODBC-devel \
        unzip \
        vim \
        wget \
        which \
        xcb-util-cursor \
        xorg-x11-server-Xvfb \
        xz \
        xz-devel \
        yasm \
        zeromq-devel \
        zip \
        zlib-devel \
    && dnf clean all && rm -rf /var/cache/dnf

# Update CMake
ENV CMAKE_VERSION=3.28.3
RUN curl -L https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz | tar -xz  && \
    cd cmake-${CMAKE_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r cmake-${CMAKE_VERSION}    

# Build SDL2 for testing pygame
ENV SDL_VERSION=2.26.2
RUN curl -L https://github.com/libsdl-org/SDL/releases/download/release-${SDL_VERSION}/SDL2-${SDL_VERSION}.tar.gz | tar -xz  && \
    cd SDL2-${SDL_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r SDL2-${SDL_VERSION}

ENV SDL_TTF_VERSION=2.20.1
RUN curl -L https://github.com/libsdl-org/SDL_ttf/releases/download/release-${SDL_TTF_VERSION}/SDL2_ttf-${SDL_TTF_VERSION}.tar.gz | tar -xz  && \
    cd SDL2_ttf-${SDL_TTF_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r SDL2_ttf-${SDL_TTF_VERSION}

ENV SDL_IMAGE_VERSION=2.6.2
RUN curl -L https://github.com/libsdl-org/SDL_image/releases/download/release-${SDL_IMAGE_VERSION}/SDL2_image-${SDL_IMAGE_VERSION}.tar.gz | tar -xz  && \
    cd SDL2_image-${SDL_IMAGE_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r SDL2_image-${SDL_IMAGE_VERSION}

ENV SDL_MIXER_VERSION=2.6.2
RUN curl -L https://github.com/libsdl-org/SDL_mixer/releases/download/release-${SDL_MIXER_VERSION}/SDL2_mixer-${SDL_MIXER_VERSION}.tar.gz | tar -xz  && \
    cd SDL2_mixer-${SDL_MIXER_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r SDL2_mixer-${SDL_MIXER_VERSION}

ENV PROJ_VERSION=9.1.1
RUN curl -L https://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz | tar -xz  && \
    cd proj-${PROJ_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build . --parallel && \
    cmake --build . --target install && \
    cd ../.. && \
    rm -r proj-${PROJ_VERSION}

# For rasterio
ENV GDAL_VERSION=3.6.1
RUN curl -L https://github.com/OSGeo/gdal/releases/download/v${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz | tar -xz  && \
    cd gdal-${GDAL_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build && \
    cmake --install build && \
    cd .. && \
    rm -r gdal-${GDAL_VERSION}

ENV LIBRDKAFKA_VERSION=2.0.2
RUN curl -L https://github.com/confluentinc/librdkafka/archive/refs/tags/v${LIBRDKAFKA_VERSION}.tar.gz | tar -xz  && \
    cd librdkafka-${LIBRDKAFKA_VERSION} && \
    ./configure && \
    make -j 8 && \
    make install && \
    cd .. && \
    rm -r librdkafka-${LIBRDKAFKA_VERSION}

ENV NINJA_VERSION=1.11.1
RUN curl -L https://github.com/ninja-build/ninja/archive/refs/tags/v${NINJA_VERSION}.tar.gz | tar -xz  && \
    cd ninja-${NINJA_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r ninja-${NINJA_VERSION}

ENV LIBGIT2_VERSION=1.8.1
RUN curl -L https://github.com/libgit2/libgit2/archive/refs/tags/v${LIBGIT2_VERSION}.tar.gz | tar -xz && \
    cd libgit2-${LIBGIT2_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r libgit2-${LIBGIT2_VERSION}

ENV FAISS_VERSION=1.8.0
RUN curl -L https://github.com/facebookresearch/faiss/archive/refs/tags/v${FAISS_VERSION}.tar.gz | tar -xz && \
    cd faiss-${FAISS_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DFAISS_ENABLE_GPU=OFF -DFAISS_ENABLE_PYTHON=OFF && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r faiss-${FAISS_VERSION}

ENV BISON_VERSION=3.8
RUN curl -L https://ftp.gnu.org/gnu/bison/bison-${BISON_VERSION}.tar.xz | tar -xJ && \
    cd bison-${BISON_VERSION} && \
    ./configure && \
    make -j4 && \
    make install && \
    cd .. && \
    rm -r bison-${BISON_VERSION}

ENV SWIG_VERSION=4.1.1
RUN curl -L https://github.com/swig/swig/archive/refs/tags/v${SWIG_VERSION}.tar.gz | tar -xz && \
    cd swig-${SWIG_VERSION} && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd .. && \
    rm -r swig-${SWIG_VERSION}

ENV PROTOBUF_VERSION=3.19.6
RUN curl -L https://github.com/protocolbuffers/protobuf/archive/refs/tags/v${PROTOBUF_VERSION}.tar.gz | tar -xz && \
    cd protobuf-${PROTOBUF_VERSION}/cmake && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -Dprotobuf_BUILD_TESTS=OFF && \
    cmake --build build --parallel && \
    cmake --install build && \
    cd ../.. && \
    rm -r protobuf-${PROTOBUF_VERSION}

RUN ldconfig

# Install bazelisk for fetching bazel
ENV USE_BAZEL_FALLBACK_VERSION=silent:6.0.0
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.15.0/bazelisk-linux-amd64 -o /usr/local/bin/bazel && \
    chmod 755 /usr/local/bin/bazel

RUN pip3 install auditwheel patchelf

### User setup
RUN useradd -d /rusthome -s /bin/bash builder && \
    git config --global user.name "Builder" && \
    git config --global user.email "builder@example.com" && \
    su builder -c 'git config --global user.name "Builder"' && \
    su builder -c 'git config --global user.email "builder@example.com"'

# Install rustup for getting recent rust, as builder user so rustup doesn't complain
RUN su builder -c 'mkdir -p /rusthome/.config/fish/conf.d/' && \
    su builder -c 'touch /rusthome/.config/fish/conf.d/rustup.fish' && \
    su builder -c 'curl -fs -o /rusthome/rustup.sh https://sh.rustup.rs' && \
    su -c 'sh /rusthome/rustup.sh -y --default-toolchain 1.77.2'

ENV PATH="/rusthome/.cargo/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
