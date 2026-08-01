FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:6ae249f1c94ecdcea53bf0bf8f89288f943c6ad1420374706d0b960ea770781b

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
