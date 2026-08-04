FROM rocker/binder:4.4.2

USER root
COPY . /home/rstudio
RUN chown -R ${NB_USER}:${NB_USER} /home/rstudio
USER ${NB_USER}
WORKDIR /home/rstudio

RUN R -e "options(repos = c(CRAN = 'https://packagemanager.posit.co/cran/__linux__/jammy/2025-01-15')); install.packages(c('dplyr', 'googlesheets4', 'purrr'))"
