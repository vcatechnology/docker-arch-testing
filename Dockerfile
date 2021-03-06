FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Build-time metadata as defined at http://label-schema.org
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="$PROJECT_NAME" \
      org.label-schema.description="An up-to-date Arch Linux image with packages to check the format and linting of the testing scripts" \
      org.label-schema.url="https://www.archlinux.org/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/vcatechnology/docker-arch-testing" \
      org.label-schema.vendor="VCA Technology" \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

# Install packages
RUN sudo vca-install-package \
  gcc \
  pkg-config \
  cairo \
  gobject-introspection \
  git \
  make \
  python-pip \
  python-pylint \
  yapf \
  python-requests \
  python-pytest \
  python-sphinx \
  python-sphinx_rtd_theme

# Install pip packages
RUN sudo pip install pytest-ordering PyGObject validators

