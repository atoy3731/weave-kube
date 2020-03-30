ARG BASE_REGISTRY=nexus-docker-secure.levelup-nexus.svc.cluster.local:18082
ARG BASE_IMAGE=redhat/ubi/ubi7
ARG BASE_TAG=7.8

#FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}
FROM registry.access.redhat.com/ubi7/ubi

LABEL name="weave-kube" \
      maintainer="Rancher Labs <support@rancher.com>" \
      vendor="Rancher" \
      version="2.5.2" \
      release="1" \
      summary="weave-kube" \
      description="weave-kube"

COPY LICENSE /licenses/weave-kube

USER root

RUN yum install -y --disablerepo="*" --enablerepo="*ubi-7*" ipset

ADD ./launch.sh ./kube-utils /home/weave/
ADD ./weaveutil /usr/bin

RUN chmod +x /home/weave/kube-utils /home/weave/launch.sh /usr/bin/weaveutil

ENTRYPOINT ["/home/weave/launch.sh"]

ARG revision
LABEL org.opencontainers.image.revision="${revision}"