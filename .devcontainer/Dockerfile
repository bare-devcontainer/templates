FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:c64d24faad7b0a1297b4ca7e0ee5af174d8f1f4a6945737ee894eb1a6d181409

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
