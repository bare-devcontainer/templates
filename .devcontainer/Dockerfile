FROM ghcr.io/bare-devcontainer/debian:trixie-20260711@sha256:a4016263075479795268ddc3f312d4ce487d6599cd24f537d441ece216bf4677

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
