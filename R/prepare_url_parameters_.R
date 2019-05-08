#' @title Transform list to string
#' @description Transform list in string, for use in requests from pipedrive's API
#' @param x list with parameters that you wish put in url format request
#' @return a formatted string
#' @export
#' @examples \dontrun{
#' #Example
#' prepare_url_parameters_(list(field1 = 123, field2 = NULL, field3 = "name"))
#' }
prepare_url_parameters_ <- function(x){
  if(!is.null(x)){
    str <- ""
    for(i in 1:length(x)){
      str <- paste0(str, names(x[i]), "=", x[[i]], "&")
    }
  }
  return(str)
}
