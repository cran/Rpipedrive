#' @title Link a remote file to an item
#' @description Function to Link a remote file to an item on pipedrive.
#' @param item_type The item type. This field has the following domains: (deal; organization; person)
#' @param item_id ID of the item to associate the file with.
#' @param remote_id The remote item id.
#' @param remote_location The location type to send the file to. Only googledrive is supported at the moment. This field has the following domains: (googledrive)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' files.remotelink(item_type='e.g.',item_id='e.g.',remote_id='e.g.',remote_location='e.g.')
#' }
files.remotelink <- function(item_type, item_id, remote_id, remote_location, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/files/remoteLink?'
bodyList <- list(item_type=item_type,item_id=item_id,remote_id=remote_id,remote_location=remote_location)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
