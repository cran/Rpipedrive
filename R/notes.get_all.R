#' @title Get all notes
#' @description Function to Get all notes from pipedrive.
#' @param user_id ID of the user whose notes to fetch. If omitted, notes by all users will be returned.
#' @param deal_id ID of the deal which notes to fetch. If omitted, notes about all deals with be returned.
#' @param person_id ID of the person whose notes to fetch. If omitted, notes about all persons with be returned.
#' @param org_id ID of the organization which notes to fetch. If omitted, notes about all organizations with be returned.
#' @param start Pagination start
#' @param limit Items shown per page
#' @param sort Field names and sorting mode separated by a comma (field_name_1 ASC, field_name_2 DESC). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, content, add_time, update_time.
#' @param start_date Date in format of YYYY-MM-DD from which notes to fetch from.
#' @param end_date Date in format of YYYY-MM-DD until which notes to fetch to.
#' @param pinned_to_deal_flag If set, then results are filtered by note to deal pinning state. This field has the following domains: (0; 1)
#' @param pinned_to_organization_flag If set, then results are filtered by note to organization pinning state. This field has the following domains: (0; 1)
#' @param pinned_to_person_flag If set, then results are filtered by note to person pinning state. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' notes.get_all(api_token='token',company_domain='exp')
#' }
notes.get_all <- function(user_id=NULL, deal_id=NULL, person_id=NULL, org_id=NULL, start=NULL, limit=NULL, sort=NULL, start_date=NULL, end_date=NULL, pinned_to_deal_flag=NULL, pinned_to_organization_flag=NULL, pinned_to_person_flag=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/notes?'
bodyList <- list(user_id=user_id,deal_id=deal_id,person_id=person_id,org_id=org_id,start=start,limit=limit,sort=sort,start_date=start_date,end_date=end_date,pinned_to_deal_flag=pinned_to_deal_flag,pinned_to_organization_flag=pinned_to_organization_flag,pinned_to_person_flag=pinned_to_person_flag)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
return(get_all_(url))
}
