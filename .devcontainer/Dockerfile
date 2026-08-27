FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:9eb43a500855c576f32d873134705989d1e0637ddc6c89bb36efe323b67134b8

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

