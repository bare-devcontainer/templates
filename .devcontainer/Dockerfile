FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:0193f0c53e1a2097c0812401daa795d04f36922bd1206fa8cfd7cdff8b6f0047

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && echo "deb [signed-by=/tmp/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
          | tee /etc/apt/sources.list.d/claude-code.list \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

