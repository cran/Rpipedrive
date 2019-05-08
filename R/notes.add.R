#' @title Add a note
#' @description Function to Add a note on pipedrive.
#' @param content Content of the note in HTML format. Subject to sanitization on the back-end.
#' @param deal_id ID of the deal the note will be attached to.
#' @param person_id ID of the person this note will be attached to.
#' @param org_id ID of the organization this note will be attached to.
#' @param add_time Optional creation date & time of the Note in UTC. Can be set in the past or in the future. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
#' @param pinned_to_deal_flag If set, then results are filtered by note to deal pinning state (deal_id is also required). This field has the following domains: (0; 1)
#' @param pinned_to_organization_flag If set, then results are filtered by note to organization pinning state (org_id is also required). This field has the following domains: (0; 1)
#' @param pinned_to_person_flag If set, then results are filtered by note to person pinning state (person_id is also required). This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' notes.add(content='e.g.',api_token='token',company_domain='exp')
#' }
notes.add <- function(content, deal_id=NULL, person_id=NULL, org_id=NULL, add_time=NULL, pinned_to_deal_flag=NULL, pinned_to_organization_flag=NULL, pinned_to_person_flag=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/notes?'
bodyList <- list(content=content,deal_id=deal_id,person_id=person_id,org_id=org_id,add_time=add_time,pinned_to_deal_flag=pinned_to_deal_flag,pinned_to_organization_flag=pinned_to_organization_flag,pinned_to_person_flag=pinned_to_person_flag)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
