FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:fa21c82ee1d80ae39253608b92537d1bd89b56a77a9bb8884374daf7cf0598c0

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

