#' @title Update filter
#' @description Function to Update filter on pipedrive.
#' @param id ID of the filter to update.
#' @param name Filter name
#' @param conditions Filter conditions as a JSON object. It requires a minimum structure as follows: {glue:and,conditions:[{glue:and,conditions: [CONDITION_OBJECTS]},{glue:or,conditions:[CONDITION_OBJECTS]}]}. Replace CONDITION_OBJECTS with JSON objects of the following structure: {object:,field_id:, operator:,value:, extra_value:} or leave the array empty.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' filters.update(id='e.g.',conditions='e.g.',api_token='token',company_domain='exp')
#' }
filters.update <- function(id, conditions, name=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/filters/{id}?'
bodyList <- list(id=id,name=name,conditions=conditions)
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
