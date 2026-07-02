FROM ghcr.io/bare-devcontainer/debian:trixie-20260702@sha256:9e83023f35e2d5b99660cd10b0f778e4d9d8b609d6a44a7d7f124492088ade99

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
