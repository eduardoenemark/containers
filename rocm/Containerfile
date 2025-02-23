FROM docker.io/rocm/dev-ubuntu-24.04:6.3.3-complete

LABEL org.opencontainers.image.ref.name=rocm/dev-ubuntu-24.04plusplus
LABEL org.opencontainers.image.version=1.0-base-6.3.3-complete
LABEL org.opencontainers.image.authors=eduardoenemark
LABEL org.opencontainers.image.source=github.com/eduardoenemark/containers/rocm
LABEL org.opencontainers.image.title="ROCM Dev Ubuntu 24.04++"

RUN apt update
RUN apt install -y amdgpu
RUN apt install -y rocm

CMD [ "/bin/bash" ]
