#' @title Add or update role setting
#' @description Function to Add or update role setting on pipedrive.
#' @param id ID of the role This field has the following domains: (deal_default_visibility; org_default_visibility; person_default_visibility; product_default_visibility; deal_access_level; org_access_level; person_access_level; product_access_level)
#' @param value Possible values for default_visibility settings: 0...1; for access_level settings: 1...7 This field has the following domains: (0; 1; 2; 3; 4; 5; 6; 7)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' roles.add.settings(id='e.g.',value='e.g.',api_token='token',company_domain='exp')
#' }
roles.add.settings <- function(id, value, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/roles/{id}/settings?'
bodyList <- list(id=id,value=value)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
