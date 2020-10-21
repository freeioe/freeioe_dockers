FROM --platform=$BUILDPLATFORM debian:buster AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN apt-get update && apt-get install -y git \ 
    make \ 
    autoconf \
    gcc \
    g++ \
    libreadline-dev \
	libssl-dev \
	libcurl4-openssl-dev \
	libenet-dev \
	libmodbus-dev \
	zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/srdgame/process-monitor /process-monitor \
	&& cd /process-monitor \
	&& make PREFIX=/usr

RUN git clone https://github.com/srdgame/skynet.git /skynet \
    && cd /skynet \
	&& git submodule update --init --recursive \
	&& mkdir -p luaclib/rs232

WORKDIR /skynet

RUN if [[ "$TARGETPLATFORM"x = "linux/amd64"x]] || [["$TARGETPLATFORM"x = "linux/386"x ]]; then make linux; else make linux SKYNET_DEFINES=-DNOUSE_JEMALLOC ; fi

COPY pack_skynet.sh /

RUN sh /pack_skynet.sh

# The release image
FROM debian:buster-slim

RUN apt-get update && apt-get install -y openssl \
    libreadline7 \
	libcurl4 \
	libenet7 \
	libmodbus5 \
	zlib1g \
	wget \
	zip \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/ioe_ipt
RUN mkdir -p /usr/ioe
COPY --from=build /process-monitor/process-monitor /usr/bin/
COPY --from=build /skynet/skynet_release.tar.gz /usr/ioe_ipt/skynet.tar.gz
COPY --from=build /skynet/skynet_release.tar.gz.md5 /usr/ioe_ipt/skynet.tar.gz.md5

RUN wget http://openwrt.kooiot.com/download/freeioe/1366.tar.gz -O /usr/ioe_ipt/freeioe.tar.gz
RUN wget http://openwrt.kooiot.com/download/freeioe/1366.tar.gz.md5 -O /usr/ioe_ipt/freeioe.tar.gz.md5

# RUN mkdir -p /usr/ioe/skynet
# RUN cd /usr/ioe/skynet && tar xzvf /usr/ioe/ipt/skynet.tar.gz

# RUN mkdir -p /usr/ioe/freeioe
# RUN cd /usr/ioe/freeioe && tar xzvf /usr/ioe/ipt/freeioe.tar.gz

# RUN mkdir /ioe

COPY docker-entrypoint.sh /
COPY run.sh /

VOLUME [ "/usr/ioe" ]

EXPOSE 6606 8808 8818

WORKDIR /usr/ioe/skynet

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start"]

