FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:443a7220cba7e56193fc6f61f519688f9355b23e6454282a29d3d7e8aaa18369

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && echo "deb [signed-by=/tmp/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
          | tee /etc/apt/sources.list.d/claude-code.list \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

