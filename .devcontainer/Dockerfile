FROM ghcr.io/bare-devcontainer/debian:trixie-20260628@sha256:c12950c0c9ebfe3f7217d9b867a28586cc306438f8b2c48dafd8732249131fa8

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
