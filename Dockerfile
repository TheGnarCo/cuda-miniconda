FROM nvidia/cuda:12.0.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    gcc \
    llvm \
    cmake \
    make \
    g++ \
    libsndfile1 \
    ffmpeg \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p /opt/conda
RUN rm ~/miniconda.sh
ENV PATH="${PATH}:/opt/conda/bin"

RUN conda update -n base -c defaults conda
RUN conda install python=3.8 -y
RUN conda install pip
RUN conda install -c conda-forge gdown
RUN conda clean --all -y
