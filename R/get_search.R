#' @title GET Search Results for a CAS Registry Number and Other Identifiers
#' @description This function performs a query to search for substances based
#'   on a CAS Registry Number or other identifiers.
#' @param q (Character) The (partial) search term. The following search terms
#'   are supported: CAS Registry Number (with or without dashes), SMILES
#'   (canonical or isomeric), InChI (with or without the "InChI=" prefix),
#'   InChIKey, and name. Searching by name allows use of a trailing wildcard
#'   (e.g., car*). All searches are case-insensitive.
#' @param json (Logical) Should the result be returned as JSON? Defaults to
#'   \code{FALSE}.
#' @details The function performs a sanity check on the provided search term
#'   and then performs a query. If successful, a list with the available
#'   information will be returned.
#' @note When searching for an InChIKey, the prefix \code{"InChIKey="} needs to
#'   be added.
#' @return Returns a list.
#' @author Raoul Wolf (\url{https://github.com/RaoulWolf/})
#' @examples \dontrun{
#' q <- "Aspiri*"
#' get_search(q)
#' }
#' @importFrom curl curl_fetch_memory handle_setopt new_handle
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#' @export
get_search <- function(q, json = FALSE) {

  # sanity-check q
  if (missing(q) || is.na(q) || is.null(q)) {
    return(list("message" = "Invalid search term."))
  }

  # sanity-check json
  if (!is.logical(json) || is.na(json)) {
    json <- FALSE
  }

  # compose url
  url <- paste(
    "https://commonchemistry.cas.org/api/search",
    paste("q", utils::URLencode(q, reserved = TRUE), sep = "="),
    sep = "?"
  )

  # create new cURL handle
  handle <- curl::new_handle()

  # specify GET request
  curl::handle_setopt(handle, customrequest = "GET")

  # retrieve results
  result <- curl::curl_fetch_memory(url, handle)

  # decode content
  content <- rawToChar(result$content)

  # check status
  if(result$status_code != 200L) {
    if(json) {
      return(content)
    } else {
      return(list())
    }
  }

  # transform content
  if(!json) {
    content <- jsonlite::fromJSON(content)
  }

  # return content
  content

}
