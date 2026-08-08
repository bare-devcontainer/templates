FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:7a5f4d4b5bfd496c2a751cd543838e2d04295912267a1ee7a6384398a729c4cc

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
