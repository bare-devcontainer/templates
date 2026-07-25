FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:709adc59c1bd061e416d33119aad002fd361b4058a845543d9ddc4fac762dd48

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
