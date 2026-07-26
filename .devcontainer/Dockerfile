FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:113577d2f862fc4cfe3f9cc47ee74ccb6879089c283354b1f19caef77201774a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
