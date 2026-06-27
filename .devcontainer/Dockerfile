FROM ghcr.io/bare-devcontainer/debian:trixie-20260626@sha256:21d045f3696ec7f2f24a0fb65207c9b4d80f5052ae1a38be940f00a137db82a9

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
