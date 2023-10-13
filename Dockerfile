#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:aa7ee6b60c8e983b14149a97c4aae054bf2f6a4524f7be2f082871e7110b7c1a as build-focal
FROM ubuntu:jammy@sha256:990350fbc1af973523f0aaa5ec8ad96ab1ad6193a657557628e6aa35eaa2ca2f as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
