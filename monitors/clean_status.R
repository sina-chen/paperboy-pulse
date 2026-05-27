raw <- readLines("data/status_raw.csv", encoding = "UTF-8")
cleaned <- gsub("\r", "", raw)
cleaned <- ifelse(startsWith(cleaned, '"') & endsWith(cleaned, '"'),
                  substr(cleaned, 2, nchar(cleaned) - 1),
                  cleaned)
cleaned <- gsub('""', '"', cleaned)
writeLines(cleaned, "data/status.csv")