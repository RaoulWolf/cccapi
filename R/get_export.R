#' @title GET the MOL Export for a CAS Registry Number
#' @description This function performs a query to retrieve a MOL file for a CAS
#'   Registry Number.
#' @param cas_rn (Character) CAS Registry Number in "dash" format, e.g.,
#'   "50-78-2".
#' @param attachment (Logical) Should the result be returned as attachment?
#'   Currently only \code{FALSE} is supported.
#' @details The function performs a sanity check on the provided CAS Registry
#'   Number and then performs a query. If successful, a character string with
#'   the available MOL file will be returned.
#' @return Returns a character string.
#' @author Raoul Wolf (\url{https://github.com/RaoulWolf/})
#' @examples \dontrun{
#' cas_rn <- "50-78-2"
#' get_export(cas_rn)
#' }
#' @importFrom curl curl_fetch_memory handle_setopt new_handle
#' @export
get_export <- function(cas_rn, attachment = FALSE) {

  if (isFALSE(.check_cas(cas_rn))) {
    return("Invalid CAS Registry Number.")
  }

  if (!isFALSE(attachment)) {
    attachment <- FALSE
  }

  cas <- gsub(pattern = "-", replacement = "", cas_rn)

  uri <- paste0("substance/pt/", cas)

  attachment <- paste0("&returnAsAttachment=", tolower(attachment))

  url <- paste0("commonchemistry.cas.org/api/export?uri=", uri, attachment)

  handle <- curl::new_handle()

  curl::handle_setopt(handle = handle, customrequest = "GET")

  result <- curl::curl_fetch_memory(url = url, handle = handle)

  content <- rawToChar(result$content)

  content

}
