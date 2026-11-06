FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:169c1e19b0afe36a6e718d8449a333061b61814e4530cd8301eeb910ef3062c8

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

