FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:7e3d1c1e5b1aa522383ecd861889823500025dbb205351b1397be91d4f686e7a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
