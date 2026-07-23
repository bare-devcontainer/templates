FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:b372ef12505e3efe7910c36902bddd1bba5bf1010450570260eeae9337879d15

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
