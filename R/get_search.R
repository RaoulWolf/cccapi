#' @title GET Search Results for a CAS Registry Number and Other Identifiers
#' @description This function performs a query to search for substances based
#'   on a CAS Registry Number or other identifiers.
#' @param q (Character) The (partial) search term. The following search terms
#'   are supported: CAS Registry Number (with or without dashes), SMILES
#'   (canonical or isomeric), InChI (with or without the "InChI=" prefix),
#'   InChIKey, and name. Searching by name allows use of a trailing wildcard
#'   (e.g., car*). All searches are case-insensitive.
#' @param offset (NULL) Currently not implemented.
#' @param size (NULL) Currently not implemented.
#' @details The function performs a sanity check on the provided search term
#'   and then performs a query. If successful, a list with the available
#'   information will be returned.
#' @return Returns a list.
#' @author Raoul Wolf (\url{https://github.com/RaoulWolf/})
#' @examples \dontrun{
#' q <- "Aspi*"
#' get_search(q)
#' }
#' @importFrom curl curl_fetch_memory handle_setheaders handle_setopt new_handle
#' @importFrom jsonlite fromJSON
#' @export
get_search <- function(q, offset = NULL, size = NULL) {

  if (!is.character(q)) {
    return(list(NULL))
  }

  url <- paste0("commonchemistry.cas.org/api/search?q=", q)

  handle <- curl::new_handle()

  curl::handle_setopt(handle = handle, customrequest = "GET")
  curl::handle_setheaders(handle = handle)

  result <- curl::curl_fetch_memory(url = url, handle = handle)

  content <- rawToChar(result$content)
  content <- jsonlite::fromJSON(content)

  content

}
