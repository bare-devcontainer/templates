FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:1b00f7219643a16dba4eb534094e52a95348d3d1f257fd9583c5b4d9a810980f

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
