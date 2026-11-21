FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:4b62504b9054a8e158401d4922c1793ba814dfea654d460aca78cf3df627ba8c

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

