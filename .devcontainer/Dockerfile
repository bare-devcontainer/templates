FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a671255b2311c970dbf372e8d5e52516f4b1327ad52ed3c55004460916fcfae6

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

