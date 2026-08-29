FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:4234361b8aac4fe7696155cbc3017294f615e4c13fce3374078b027493e61464

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

