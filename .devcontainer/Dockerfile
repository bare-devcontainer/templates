FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:c79bdda9cfaf6a9709f8e62d41afaaa0add750dbbe51fe5d3ceb21676caa7fd4

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

