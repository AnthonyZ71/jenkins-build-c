FROM sentinel:5000/jenkins-build-base:latest

## Configuration for C / C++ development

RUN \
  echo "==================== Installing dependencies:" && \
  apt-get update && \
  apt-get install -y build-essential libcurl4-openssl-dev \
          libjansson-dev libmicrohttpd-dev \
          libpam0g-dev && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean

ARG BUILD_DATE
ARG IMAGE_NAME
ARG IMAGE_VERSION
LABEL build-date="$BUILD_DATE" \
    description="Image for C/C++ development" \
    summary="C / C++ tooling" \
    name="$IMAGE_NAME"  \
    release="$IMAGE_VERSION" \
    version="$IMAGE_VERSION"
