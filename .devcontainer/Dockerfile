FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:9081a4105d26f2e204b91969db2579e2f6922c215f4ffcf1e047e0c6bd8c78ef

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

