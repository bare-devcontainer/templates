FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:383500f28db63c3493cde6e78608934825773c0a9932c40f3c7a7aeafcf29bba

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

