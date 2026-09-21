FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:649951aafe28c7a4b396b9019427b84d7d24a7b1e9e24c1c1ccee5a82be36ba3

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

