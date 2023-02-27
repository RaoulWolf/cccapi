#' @title GET the MOL Export for a CAS Registry Number
#' @description This function performs a query to retrieve a MOL file for a CAS
#'   Registry Number.
#' @param cas_rn (Character) CAS Registry Number in "dash" format, e.g.,
#'   "50-78-2".
#' @param verbose (Logical) Should the result be returned as is? Defaults to
#'   \code{FALSE}.
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
get_export <- function(cas_rn, verbose = FALSE) {

  # sanity-check cas_rn
  if (isFALSE(.check_cas(cas_rn))) {
    return("Invalid CAS Registry Number.")
  }

  # remove cas_rn dashes
  cas <- gsub(pattern = "-", replacement = "", cas_rn)

  # construct uri
  uri <- paste0("substance/pt/", cas)

  # define attachment
  attachment <- paste0("&returnAsAttachment=", tolower(FALSE))

  # compose url
  url <- paste0("commonchemistry.cas.org/api/export?uri=", uri, attachment)

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
    if(verbose) {
      return(content)
    } else {
      return(NA_character_)
    }
  }

  # return content
  content

}
