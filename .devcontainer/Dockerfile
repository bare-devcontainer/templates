FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:cfb1b8aa79ef14ccded26c9524211b130871094a51e2592f7e318cef8e8a2805

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

