FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:d4965162e79933b30747a5d0decb537137a57d7c5d377c76978e19cae2f408a6

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

