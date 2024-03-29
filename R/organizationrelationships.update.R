#' @title Update an organization relationship
#' @description Function to Update an organization relationship on pipedrive.
#' @param id ID of the organization relationship
#' @param org_id ID of the base organization for the returned calculated values
#' @param type The type of organization relationship. This field has the following domains: (parent; related)
#' @param rel_owner_org_id The owner of this relationship. If type is 'parent', then the owner is the parent and the linked organization is the daughter.
#' @param rel_linked_org_id The linked organization in this relationship. If type is 'parent', then the linked organization is the daughter.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' organizationrelationships.update(id='e.g.',api_token='token',company_domain='exp')
#' }
organizationrelationships.update <- function(id, org_id=NULL, type=NULL, rel_owner_org_id=NULL, rel_linked_org_id=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/organizationRelationships/{id}?'
bodyList <- list(id=id,org_id=org_id,type=type,rel_owner_org_id=rel_owner_org_id,rel_linked_org_id=rel_linked_org_id)
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
