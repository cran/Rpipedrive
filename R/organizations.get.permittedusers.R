#' @title List permitted users
#' @description Function to List permitted users from pipedrive.
#' @param id ID of the organization
#' @param access_level If set, filter results by allowed access level. 1 = Read, 2 = Write, 3 = Read+Write This field has the following domains: (1; 2; 3)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' organizations.get.permittedusers(id='e.g.',api_token='token',company_domain='exp')
#' }
organizations.get.permittedusers <- function(id, access_level=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/organizations/{id}/permittedUsers?'
bodyList <- list(id=id,access_level=access_level)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
return(get_all_(url))
}
