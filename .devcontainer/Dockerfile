FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:aa5a054669962e07f98d9cff3e5e255d2d09545111b8d062757b486cf1fbc229

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

