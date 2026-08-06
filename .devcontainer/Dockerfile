FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:1d938e56821f487eff1e860e6def885f6d8c76647f9ca695bc84442ca30273d8

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
