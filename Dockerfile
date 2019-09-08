FROM debian:buster

LABEL maintainer="amn@fantashley.com"

RUN apt-get update && \
    apt-get install -y \
    	binutils \
	bison \
	build-essential \
	bzip2 \
	coreutils \
	diffutils \
	findutils \
	gawk \
	gcc \
	grep \
	gzip \
	m4 \
	make \
	patch \
	perl \
	python \
	python3 \
	sed \
	tar \
	texinfo \
	vim \
	wget

ARG MACHINE_ARCH=x86_64

ENV LFS=/mnt/lfs
ENV LC_ALL=POSIX
ENV LFS_TGT=$MACHINE_ARCH-lfs-linux-gnu
ENV PATH=/tools/bin:/bin:/usr/bin

ENV FORCE_UNSAFE_CONFIGURE=1 

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh

RUN mkdir -p /mnt/lfs/source && \
    mkdir -p /mnt/lfs/tools && \
    ln -s /mnt/lfs/tools /

COPY version-check.sh .
COPY .bashrc /root/.bashrc

VOLUME ["/mnt/lfs"]

CMD ./version-check.sh
