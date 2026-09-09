FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:aac314d3f8a0c65a141c5e22399dc64a524ea11ce81a8dc0dd4bd9af9c83aa23

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

