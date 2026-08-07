FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:6585e3fca0865a5e337acca384164f152d9368768db3900f68de07164f44b12a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
