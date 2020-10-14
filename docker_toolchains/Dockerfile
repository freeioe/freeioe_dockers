FROM alpine:latest

RUN mkdir -p /toolchain
RUN mkdir -p /bin

COPY toolchains /toolchains
COPY uncompress_toolchains.sh /uncompress_toolchains.sh

RUN chmod +x /uncompress_toolchains.sh
RUN /uncompress_toolchains.sh

ENTRYPOINT ["/bin/sh"]

CMD ["/bin/sh"]
