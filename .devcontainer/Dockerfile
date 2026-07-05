FROM ghcr.io/bare-devcontainer/debian:trixie-20260704@sha256:7c544210e1fa600d63a258978cdb3ff56b422bfe38f44832a6f99e08906f543a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
