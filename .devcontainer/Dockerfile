FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:dfed8bb7a810a05d476bfc597c1822080319b3c31c61c1fcfa473e862f266fde

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

