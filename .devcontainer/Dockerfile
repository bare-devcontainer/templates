FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:eed3820c58b1b2391fc8434c0dde9034b213af0ebe246355fcc66abfbb0d6a32

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

