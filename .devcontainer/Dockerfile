FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:9c37cb6cae91a81d053761f23d7249122d4f683f7859ef38725188ed57532ab5

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

