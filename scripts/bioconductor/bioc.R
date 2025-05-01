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
                        "SpotSweeper", "HuBMAPR")) %>% 
  group_by(Package) %>% 
  summarize(total=sum(Nb_of_distinct_IPs))
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
