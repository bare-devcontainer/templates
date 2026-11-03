FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:5b9a8264c9cbf14cd8ad6b8e97fff3c45f7c2a832104f6afb9d42390bf502c2c

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

