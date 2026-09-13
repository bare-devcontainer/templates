FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:e2fee1e8cd530042d38ab22bdf44f79e7c14fc0a07e010cc99a927b4f25b3e9a

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

