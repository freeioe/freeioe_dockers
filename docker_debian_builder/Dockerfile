FROM debian:buster

# RUN mkdir -p /toolchains
# COPY toolchains /toolchains

COPY download_toolchains.sh /download_toolchains.sh
COPY uncompress_toolchains.sh /uncompress_toolchains.sh

RUN chmod +x /download_toolchains.sh
RUN chmod +x /uncompress_toolchains.sh

RUN apt-get update
RUN apt-get install -y build-essential git autoconf \
    libreadline-dev \
	libssl-dev \
	libcurl4-openssl-dev \
	libenet-dev \
	libmodbus-dev \
	zlib1g-dev \
	wget \
	zip \
	unzip \
	file \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/premake/premake-core/releases/download/v5.0.0-alpha15/premake-5.0.0-alpha15-linux.tar.gz -O /premake5.tar.gz

RUN tar -C /usr/bin -xzvf /premake5.tar.gz \
	&& chmod +x /usr/bin/premake5 \
	&& rm -f /premake5.tar.gz
