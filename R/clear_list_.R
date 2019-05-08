#' @title Clear List
#' @description Remove fields NULL in a list
#' @param x List that you wish remove fields with NULL
#' @return a List wihtout fileds wihout
#' @export
#' @examples \dontrun{
#' #Example
#' clear_list_(list(field1 = 123, field2 = NULL, field3 = "name"))
#' }
clear_list_ <- function(x){
  i <- 1
  while(i <= length(x)){
    if(is.null(x[[i]])){
      x[[i]] <- NULL
    } else {
      i <- i + 1
    }
  }

  if(length(x)==0){
    return(NULL)
  } else {
    return(x)
  }
}
