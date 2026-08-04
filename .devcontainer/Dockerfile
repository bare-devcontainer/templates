FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:55adf98d26f3c46a97f0595e341a51a7bbbab939ec65ecb12068ee9ac5c37e43

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
