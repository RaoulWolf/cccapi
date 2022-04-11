#' @source
#'   https://www.cas.org/support/documentation/chemical-substances/checkdig
.check_cas <- function(cas_rn) {

  res <- sapply(
    cas_rn,
    FUN = function(x) {

      # sanity-check cas_rn
      if (is.na(x) || is.null(x)) {
        return(FALSE)
      }

      # sanity-check cas_rn
      if (nchar(gsub(pattern = "[^-]", replacement = "", x)) != 2) {
        return(FALSE)
      }

      # remove cas_rn dashes
      cas <- gsub(pattern = "-", replacement = "", x)

      # sanity-check cas
      if (grepl(pattern = "[^[:digit:]]", cas)) {
        return(FALSE)
      }

      # sanity-check cas
      if (nchar(cas) < 5 || nchar(cas) > 10) {
        return(FALSE)
      }

      # extract check digit
      check_dig <- as.integer(substring(cas, first = nchar(cas)))

      # remove check digit from cas
      cas_str <- substr(cas, start = 1, stop = nchar(cas) - 1)

      # reverse count of numbers
      count <- nchar(cas_str):1

      # transform cas to number
      number <- as.integer(unlist(strsplit(cas_str, split = "")))

      # calculate modulo ten of the summation
      res <- sum(count * number) / 10

      # calculate result digit
      res_dig <- as.integer(round(10 * (res %% 1)))

      # compare result digit and check digit
      res_dig == check_dig

    },
    USE.NAMES = FALSE
  )

  res

}
