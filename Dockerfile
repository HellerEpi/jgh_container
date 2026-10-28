FROM rocker/r-ver:4.6.1

LABEL org.opencontainers.image.source="https://github.com/YOUR_USERNAME/jgh_container"

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libv8-dev \
    libglpk-dev \
    libgsl-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

#Install R Packages
COPY install_packages.R /tmp/install_packages.R
RUN Rscript /tmp/install_packages.R

# Install Stan/CmdStan/R
RUN R -e "install_packages(`cmdstanr`, repos = c(`https://stan-dev.r-univers.dev`,'https://cloud.r-project.org'))"
RUN R -e "cmdstanr::install_cmdstan(cores = 2)"
RUN R -e "cmdstanr::cmdstan_version()"

WORKDIR /project
CMD ["R"]


# Notes:
# created on 28OCT2026
# goal is a stable, minimal container that always works... as much as possible
#
# Part of container; other parts include install_packages.R & .github/workflows/build-push.yml

