FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:42d01856e5d2b4ac9cb2e479490ce70d1676025c3c928f2e49094e8b34cb1b11

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
