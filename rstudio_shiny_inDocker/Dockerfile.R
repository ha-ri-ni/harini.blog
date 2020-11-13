FROM rocker/rstudio:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libxt-dev \
  libjpeg-dev \
  libglu1-mesa-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  && R -e "install.packages(\"BiocManager\")" \
  && install2.r --error \
    --deps TRUE \
    shiny \
    shinyWidgets \
    shinydashboard \
    plyr \
    dplyr \
    knitr \
    tibbletime \
    anomalize \
    anytime \
    tidyverse \
    DT
