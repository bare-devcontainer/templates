FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:06574e23056a88f5e1d08611615d87425cdc4d2952ed7ec468b7d8d1c450d8af

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
