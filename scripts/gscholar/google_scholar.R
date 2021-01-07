library(tidyverse)
library(scholar)
library(here)

hicksid="4T4qnL4AAAAJ"
profile=get_profile(hicksid)

pubs=as_tibble(get_publications(hicksid))
readr::write_csv(pubs, file = here("scripts", "gscholar", "pubs.csv"))
