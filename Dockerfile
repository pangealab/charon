FROM kalilinux/kali-rolling

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION
ARG IMAGE_SOURCE_REVISION
ARG DEBIAN_FRONTEND

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Charon" \
      org.opencontainers.image.description="Docker and Kubernetes Kali offensive toolkit" \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION \
      org.opencontainers.image.authors="Anthony Angelo" \
      org.opencontainers.image.url="https://github.com/pangealab/charon/" \
      org.opencontainers.image.documentation="https://github.com/pangealab/charon/README.md" \
      org.opencontainers.image.vendor="Anthony Angelo" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/pangealab/charon.git" \
      org.opencontainers.image.revision=$IMAGE_SOURCE_REVISION

# Install Tools
RUN apt-get -q update && apt-get dist-upgrade
#     apt-get install -y wget vim curl iputils-ping jq &&\
#     apt-get install -yq kali-linux-headless &&\
#     apt-get install -yq man-db exploitdb &&\
#     apt-get clean &&\
#     rm -rf /var/lib/apt/lists/* &&\
#     rm -rf /tmp/*
