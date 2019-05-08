#' @title Edit activity type
#' @description Function to Edit activity type on pipedrive.
#' @param id ID of the activity type
#' @param name Name of the activity type
#' @param icon_key Icon graphic to use. Supported values: default, call, meeting, lunch, email, task, deadline. Additional supported values will be made available in the future.
#' @param color A designated color for the activity type in 6-character HEX format (e.g. FFFFFF for white, 000000 for black).
#' @param order_nr An order number for this activity type. Order numbers should be used to order the types in the activity type selections.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' activitytypes.update(id='e.g.',api_token='token',company_domain='exp')
#' }
activitytypes.update <- function(id, name=NULL, icon_key=NULL, color=NULL, order_nr=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/activityTypes/{id}?'
bodyList <- list(id=id,name=name,icon_key=icon_key,color=color,order_nr=order_nr)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::PUT(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
