FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:8635c6ebfa1b141775d58b8499f5fb5c83c1e24ae2c39ed2a87b83a2ab977fc2

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

