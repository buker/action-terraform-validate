FROM alpine:3.19

ARG REVIEWDOG_VERSION=v0.17.4
ARG TERRAFORM_VERSION=1.7.3

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git=2.43.4-r0 jq=1.7.1-r0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -O https://raw.githubusercontent.com/warrensbox/terraform-switcher/master/install.sh | bash


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
