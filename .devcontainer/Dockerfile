FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:1f07536f40904ecc357fafbe5cfbf0a07ceee934e684e61e257dc2849acd78f3

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

