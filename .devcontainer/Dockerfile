FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:6aad51db021ad1c0efa324d62e53538cf2c693061bc246c417c00cc7a9facab6

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
