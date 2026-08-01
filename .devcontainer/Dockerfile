FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:81a9e639d8a430961de2f85c5630ce13d49a1fd375715b150e4fad8e15de4f67

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
