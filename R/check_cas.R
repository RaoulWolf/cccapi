.check_cas <- function(cas_rn) {

  if (is.na(cas_rn)) {
    return(FALSE)
  }

  if (grepl(pattern = "[[:alpha:]]", cas_rn)) {
    return(FALSE)
  }

  cas <- gsub(pattern = "-", replacement = "", cas_rn)

  if (nchar(cas) < 5) {
    return(FALSE)
  }

  check_dig <- as.integer(substring(cas, first = nchar(cas)))

  cas_str <- substr(cas, start = 1, stop = nchar(cas) - 1)

  count <- nchar(cas_str):1

  number <- as.integer(unlist(strsplit(cas_str, split = "")))

  res <- sum(count * number) / 10

  res_int <- as.integer(round(10 * (res %% 1)))

  res_int == check_dig

}
