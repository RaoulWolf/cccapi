#' @source
#'   https://www.cas.org/support/documentation/chemical-substances/checkdig
.check_cas <- function(cas_rn, use_names = FALSE) {

  if (!is.logical(use_names) || is.na(use_names)) {
    use_names <- FALSE
  }

  res <- sapply(
    cas_rn,
    FUN = function(x) {

      if (is.na(x) || is.null(x)) {
        return(FALSE)
      }

      if (nchar(gsub(pattern = "[^-]", replacement = "", x)) != 2) {
        return(FALSE)
      }

      if (
        any(
          sapply(
            unlist(strsplit(x, split = "-")),
            FUN = function(x) { nchar(x) }
          ) == 0L
        )
	    ) {
        return(FALSE)
      }

      cas <- gsub(pattern = "-", replacement = "", x)

      if (grepl(pattern = "[^[:digit:]]", cas)) {
        return(FALSE)
      }

      if (nchar(cas) < 5 || nchar(cas) > 10) {
        return(FALSE)
      }

      check_dig <- as.integer(substring(cas, first = nchar(cas)))

      cas_str <- substr(cas, start = 1, stop = nchar(cas) - 1)

      count <- nchar(cas_str):1

      number <- as.integer(unlist(strsplit(cas_str, split = "")))

      res <- sum(count * number) / 10

      res_dig <- as.integer(round(10 * (res %% 1)))

      res_dig == check_dig

    },
    USE.NAMES = use_names
  )

  res

}
