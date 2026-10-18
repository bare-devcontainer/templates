FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d676a4f7123cb00433d2a73645b9de1dff06caab1c46c21abcea90a0f6eeba27

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

