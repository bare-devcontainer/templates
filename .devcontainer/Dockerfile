FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:134cb0d7ebe988217c1fc96596fa37d5fe7d7f37ac4a27c1e0bf1eef8d54dca3

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

