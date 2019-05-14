#' @title Execute GET from pipedrive's URL
#' @description Execute GET from pipedrive's URL, download all pages from URL and return a data frame with result.
#' @param url Pipedrive URL for get informations from bases
#' @return a data frame with result
#' @export
#' @examples \dontrun{
#' #Example
#' get_all_("https://api.pipedrive.com/v1/activities?start=0&api_token=exemaple_token")
#' }
get_all_ <- function(url) {
  pages <- list()
  i <- 1
  page <- jsonlite::fromJSON(url)

  if (!is.null(page$additional_data$pagination$more_items_in_collection)) {
    if (page$additional_data$pagination$more_items_in_collection &
        regexpr("limit=500", url)[[1]] > 1) {
      pages[[i]] <- page$data

      while (page$additional_data$pagination$more_items_in_collection) {
        page <- jsonlite::fromJSON(sub(
          "start=0",
          paste0(
            "start=",
            page$additional_data$pagination$next_start
          ),
          url
        ))

        pages[[i + 1]] <- page$data
        i <- i + 1
      }
      return(jsonlite::rbind_pages(pages))
    } else{
      return(page$data)
    }
  } else {
    return(page$data)
  }
}
