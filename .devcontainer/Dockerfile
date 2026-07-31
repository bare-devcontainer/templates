FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:a3fb91ed6cbfcf794818edd0b7c9d6d4507db6825bf5c222ac72c0d98e1c7634

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
