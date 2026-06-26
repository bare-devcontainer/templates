FROM ghcr.io/bare-devcontainer/debian:trixie-20260625@sha256:304a2fc4d2421f43f8760551c807be6b3c74eb04b2210bf622ee813622989dae

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
