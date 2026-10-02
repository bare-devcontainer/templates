FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d48f42d2b6d4d420ac307c0a18beb4d6f009c07dcc9b41d04c35351f1308b70d

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

