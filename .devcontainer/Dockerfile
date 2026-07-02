FROM ghcr.io/bare-devcontainer/debian:trixie-20260702@sha256:24b38052c497672aeab2d6815f947e75271dfbb0eca8a151dc1f4d5d915be9df

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
