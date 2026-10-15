FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:014d096c85eb6106e79cffb2220ade23eb14680d8f7f79069667283d893a0f83

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

