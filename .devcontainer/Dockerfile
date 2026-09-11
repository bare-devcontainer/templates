FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:ad6eb4975ea5b96b7ee31e7fb5de46c479d7c55006272561e464143dad0ac340

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

