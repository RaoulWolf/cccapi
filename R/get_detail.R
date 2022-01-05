#' @title GET Details for a CAS Registry Number
#' @description This function performs a query to retrieve details for a CAS
#'   Registry Number.
#' @param cas_rn (Character) CAS Registry Number with dashes, e.g., "50-78-2".
#' @param uri (NULL) Currently not implemented.
#' @details The function performs a sanity check on the provided CAS Registry
#'   Number and then performs a query. If successful, a list with the available
#'   details will be returned.
#' @return Returns a list.
#' @author Raoul Wolf (\url{https://github.com/RaoulWolf/})
#' @examples \dontrun{
#' cas_rn <- "50-78-2"
#' get_detail(cas_rn)
#' }
#' @importFrom curl curl_fetch_memory handle_setheaders handle_setopt new_handle
#' @importFrom jsonlite fromJSON
#' @export
get_detail <- function(cas_rn, uri = NULL) {

  if (isFALSE(.check_cas(cas_rn))) {
    return(list())
  }

  url <- paste0("commonchemistry.cas.org/api/detail?cas_rn=", cas_rn)

  handle <- curl::new_handle()

  curl::handle_setopt(handle = handle, customrequest = "GET")
  curl::handle_setheaders(handle = handle)

  result <- curl::curl_fetch_memory(url = url, handle = handle)

  content <- rawToChar(result$content)
  content <- jsonlite::fromJSON(content)

  content

}
