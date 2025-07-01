FROM --platform=linux/x86_64 ubuntu:noble
ENV DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source=https://github.com/mganter/openstack-client-docker

# Based on https://github.com/blang/latex-docker/blob/master/Dockerfile.ubuntu
RUN apt-get update -q && apt-get install -qy \
    gnuplot \
    git \
    make \
    python3-pygments \
    texlive-full \
    && rm -rf /var/lib/apt/lists/*

# Need inkscape to be able to include SVGs in the generated documents
RUN apt-get update \
  && apt-get install -y inkscape \
  && apt-get clean

WORKDIR /work

# CMD ["/bin/bash"]
ENTRYPOINT [ "bash", "-c" ]