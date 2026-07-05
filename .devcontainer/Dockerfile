FROM ghcr.io/bare-devcontainer/debian:trixie-20260705@sha256:83513e02f10f5d9cf06b70cac430c358d262a9cb05279a90861e08d2876d5de7

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
