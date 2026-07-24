FROM ghcr.io/bare-devcontainer/debian:trixie@sha256:59330d8e1029120a21a450341f209bb066310a57799e79e5ca70c9bc6235bd03

USER root

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    export DEBIAN_FRONTEND=noninteractive \
      && apt-get update \
      && apt-get --no-install-recommends install -y skopeo

USER dev
