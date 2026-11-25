FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:4cec50eead546731faf43ac54ec5e4cc329fafb6548449e25919173709873301

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

