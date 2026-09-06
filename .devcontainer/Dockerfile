FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:efb72150a7cae99fdbd7b76a61d8a4d526f3c8e0b66c70d27b2772cca1ec3e1e

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

