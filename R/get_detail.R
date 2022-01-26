#' @title GET Details for a CAS Registry Number
#' @description This function performs a query to retrieve details for a CAS
#'   Registry Number.
#' @param cas_rn (Character) CAS Registry Number with dashes, e.g., "50-78-2".
#' @param json (Logical) Should the result be returned as JSON? Defaults to
#'   \code{FALSE}.
#' @details The function performs a sanity check on the provided CAS Registry
#'   Number and then performs a query. If successful, a list with the available
#'   details will be returned.
#' @return Returns a list.
#' @author Raoul Wolf (\url{https://github.com/RaoulWolf/})
#' @examples \dontrun{
#' cas_rn <- "50-78-2"
#' get_detail(cas_rn)
#' }
#' @importFrom curl curl_fetch_memory handle_setopt new_handle
#' @importFrom jsonlite fromJSON
#' @export
get_detail <- function(cas_rn, json = FALSE) {

  # sanity-check cas_rn
  if (isFALSE(.check_cas(cas_rn))) {
    return(list("message" = "Invalid CAS Registry Number."))
  }

  # sanity-check json
  if (!is.logical(json) || is.na(json)) {
    json <- FALSE
  }

  # compose url
  url <- paste0("commonchemistry.cas.org/api/detail?cas_rn=", cas_rn)

  # create new cURL handle
  handle <- curl::new_handle()

  # specify GET request
  curl::handle_setopt(handle, customrequest = "GET")

  # retrieve results
  result <- curl::curl_fetch_memory(url, handle)

  # decode content
  content <- rawToChar(result$content)

  # transform content
  if (!json) {
    content <- jsonlite::fromJSON(content)
  }

  # return content
  content

}
