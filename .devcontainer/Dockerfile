FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:254c42ac25f06eb4a8cf205994c7f4e8352217108b62a9f61f705eb5f014a9ce

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

