library(here)

source(here("dashboard", "helpers.R"))
remotes::install_github("JBGruber/paperboy")
library(paperboy)

DB_PATH    <- here("data", "paperboy_monitor.sqlite")
STATUS_CSV <- here("data", "status.csv")

status_info <- read.csv(STATUS_CSV, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
run_id      <- format(Sys.time(), "%Y%m%d_%H%M%S")

init_db(DB_PATH)
run_tests(DB_PATH, run_id, status_info, n_articles = 3)

message("Run ", run_id, " completed.")
