FROM ghcr.io/bare-devcontainer/debian:trixie-20260707@sha256:0411e89d045ece7182e9c5cc9be4d685e0303ce63fc6690aa4ff8ed29ce41b19

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
