#' @title List deals associated with a person
#' @description Function to List deals associated with a person from pipedrive.
#' @param id ID of a person
#' @param start Pagination start
#' @param limit Items shown per page
#' @param status Only fetch deals with specific status. If omitted, all not deleted deals are fetched. This field has the following domains: (open; won; lost; deleted; all_not_deleted)
#' @param sort Field names and sorting mode separated by a comma (field_name_1 ASC, field_name_2 DESC). Only first-level field keys are supported (no nested keys).
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' persons.get.deals(id='e.g.',api_token='token',company_domain='exp')
#' }
persons.get.deals <- function(id, start=NULL, limit=NULL, status=NULL, sort=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/persons/{id}/deals?'
bodyList <- list(id=id,start=start,limit=limit,status=status,sort=sort)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
return(get_all_(url))
}
