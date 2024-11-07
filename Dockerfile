FROM rocker/binder:4.2.0

## Declares build arguments
ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

ENV DEBIAN_FRONTEND=noninteractive
USER root

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
libfontconfig1-dev \
libharfbuzz-dev \
libfribidi-dev \
libudunits2-dev

USER ${NB_USER}

RUN R --quiet -f install.R
