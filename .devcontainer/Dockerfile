FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:fccd3ec2883e5e724ea5001dd6b6f2f588ca94c997078465620464a60195761e

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

