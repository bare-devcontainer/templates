FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:91902463eb20c4305f4f1e9e38dda1160f140f6cc3ee17068fef53f4865fbd39

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

