FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:ef81d8db80987fa270319196c2990151759f20e258c18c065c8b59c949cd3677

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
