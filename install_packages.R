install.packages(c(
  # Bayesian
  "brms",
  "bayesplot",
  "posterior",
  "bayestestR",
  "bayesmeta",

  # Visualization / Output
  "ggplot2",
  "cowplot",
  "patchwork",
  "scales",
  "gt",

  # Cluster / Latent Class
  "mclust",
  "poLCA",
  "flexmix",
  "cluster",

  # Meta-analysis
  "meta",
  "metafor",

  # Data / Compute
  "data.table",
  "janitor",
  "readxl",
  "caret",
  "doParallel",

  # Network
  "igraph",

  # Utility
  "remotes"
), repos = "https://cloud.r-project.org")

stopifnot(
  requireNamespace("brms"),
  requireNamespace("data.table"),
  requireNamespace("gt"),
  requireNamespace("doParallel")
)

cat("All packages installed successfully.\n")
