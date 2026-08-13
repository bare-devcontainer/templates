FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:31be96a1cd74073fabc18d3f48f1e8775bac3f8929d81a7c5380e8942cea7075

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && echo "deb [signed-by=/tmp/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
          | tee /etc/apt/sources.list.d/claude-code.list \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev

