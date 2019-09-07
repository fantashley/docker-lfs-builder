FROM debian:buster

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

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh

RUN mkdir -p /mnt/lfs/source && \
    mkdir -p /mnt/lfs/tools && \
    ln -s /mnt/lfs/tools /

COPY version-check.sh .
COPY .bashrc /root/.bashrc

VOLUME ["/mnt/lfs"]

CMD ./version-check.sh
