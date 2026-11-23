FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:7c82122ce2331c260c6395dce1be9b9902ae06d2780db5629bde913c3b0ea36a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

