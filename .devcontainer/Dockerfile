FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:5665d59260295460401de7f4c105b992d284b4b976a6ca545ea9498169ad3e9b

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

