FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:8ad14db38a2797fb33a883411dfd43ee4352c609bd1dc5647f609068934a5883

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

