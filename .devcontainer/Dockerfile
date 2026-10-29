FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:2c20b4d7222760819d1c63a26606d96b424c6c15f4fde3cbc11930fba1bfaed0

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

