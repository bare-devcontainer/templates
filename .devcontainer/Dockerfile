FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:890182c029b31120b9447cb31c318a7ce65f627b1749f6d18f7478469118b505

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

