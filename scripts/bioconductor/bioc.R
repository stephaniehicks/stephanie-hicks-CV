library(tidyverse)
library(BiocPkgTools)
library(here)

pkgs <- biocDownloadStats()
head(pkgs)

software_pkgs <- pkgs %>% 
  filter(Package %in% c("quantro", "qsmooth", "methylCC", 
                        "TreeSummarizedExperiment", 
                        "mbkmeans", "scry", "spqn", "bluster",
                        "SpatialExperiment","miQC", "TREG", 
                        "nnSVG", "escheR", "spoon", 
                        "SpotSweeper", "HuBMAPR", "BatchSVG", 
                        "SpatialArtifacts")) %>% 
  group_by(Package) %>% 
  summarize(total=sum(Nb_of_distinct_IPs))
# > date()
# [1] "Mon Jun  1 21:36:05 2026"
# > sum(software_pkgs$total)
# [1] 756115
readr::write_csv(software_pkgs, 
                 file = here("scripts", "bioconductor", "software_pkg.csv"))


data_pkgs <- pkgs %>% 
  filter(Package %in% c("humanHippocampus2024", "STexampleData", 
                        "spatialLIBD", "benchmarkfdrData2019", 
                        "bodymapRat", "TENxPBMCData")) %>% 
  group_by(Package) %>% 
  summarize(total=sum(Nb_of_distinct_IPs))

readr::write_csv(data_pkgs, 
                 file = here("scripts", "bioconductor", "data_pkg.csv"))
