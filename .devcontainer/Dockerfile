FROM ghcr.io/bare-devcontainer/debian:trixie-20260709@sha256:143e9e468ef4d984d869dc8576a61f97f493a52f26e8237800eb65ef5b6c67cd

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
