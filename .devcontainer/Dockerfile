FROM ghcr.io/bare-devcontainer/debian:trixie-20260706@sha256:d6adc13d353965580198a4b716a913b00a2802be80eae0c3bbcc3a5240edfb08

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
