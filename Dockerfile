#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:268265df20a485187ca874d441ec555d892a4a963b6b69f4fac99b770c60496d as build-focal
FROM ubuntu:jammy@sha256:c42aba1ca07a1a55ce431d00793b868978b3a2fe57f77aa49fac145995df7b34 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
