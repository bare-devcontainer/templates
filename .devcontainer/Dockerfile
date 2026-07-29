FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:bf5ebbbbe10c730675bffce69f70d504fac71a26a886d79d49ab0b8db487e23f

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
