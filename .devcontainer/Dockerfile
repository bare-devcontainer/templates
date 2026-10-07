FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a3903f8de2a2bc57bdcd711da4aab2ef5a5b7f8569c1713a3dc99a8b9bd28109

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

