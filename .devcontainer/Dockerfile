FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:0da7ae0514b877bf6749d00e112892fa7ca6394ff4f5b65a15bf57d397051bd6

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

