FROM ghcr.io/bare-devcontainer/debian:trixie-20260708@sha256:dba2e7a88137b88858dfb50bf20ec312631b78f3fc65539760bfd2efed252327

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
