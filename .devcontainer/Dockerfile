FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:c1c078634cd9cd47534faa7af01f29d47334ec8ca36b842b36b2e41c9c7ae8f5

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
