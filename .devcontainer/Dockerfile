FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:9f24e64b5277d0e239d6ce491cd48a28cdd4a74176c290ee166be90b1671c244

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

