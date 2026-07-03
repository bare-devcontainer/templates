FROM ghcr.io/bare-devcontainer/debian:trixie-20260703@sha256:267384f230f9b46315e4b87e66813ed77866f31516833e788e81b96f70279bfa

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
