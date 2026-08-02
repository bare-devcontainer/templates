FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:44ea8ae5a0f9b4b1a9901c89d6f5cb68b8e68a37ab596b7449bcae7cfe21b165

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
