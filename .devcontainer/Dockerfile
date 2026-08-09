FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:67313a0e6be0ab495f96934cdeea86a48142e5f9c4de79b7e415637f70116145

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
