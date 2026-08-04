FROM rocker/binder:4.4.2

USER root

COPY binder/install.R /tmp/install.R
RUN Rscript /tmp/install.R

COPY . /home/rstudio
RUN chown -R ${NB_USER}:${NB_USER} /home/rstudio
USER ${NB_USER}
WORKDIR /home/rstudio

