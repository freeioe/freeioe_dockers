FROM alpine:latest

RUN mkdir -p /toolchains

#COPY toolchains /toolchains
COPY download_toolchains.sh /download_toolchains.sh
COPY uncompress_toolchains.sh /uncompress_toolchains.sh

RUN chmod +x /download_toolchains.sh
RUN chmod +x /uncompress_toolchains.sh

# RUN /download_toolchains.sh
# RUN /uncompress_toolchains.sh

ENTRYPOINT ["/download_toolchains.sh"]

CMD ["sh"]
