FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:29ecac919cdb37c00824e9ac66cde618edf4062e4ac1cb9405226f4e8602bddb

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

