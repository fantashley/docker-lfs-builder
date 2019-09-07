FROM debian:buster

ENV LFS /mnt/lfs

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
	wget

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh

COPY version-check.sh .

VOLUME ["/mnt/lfs"]

CMD ./version-check.sh
