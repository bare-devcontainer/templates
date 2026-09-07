FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a27ecf7ae46bded5615ca9e2903c551fe0516b7c99940e9f61051c57dcbd0ab9

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

