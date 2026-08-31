FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:01574a17e1e7f5acea0b84c5c1185d2619c436baee7840ede32244dd52701eb2

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

