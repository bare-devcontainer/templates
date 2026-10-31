FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:b2800b06ff61cc450f4a6fff97ccb412d70bcd75d6c452f93998d6ed8f05f412

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

