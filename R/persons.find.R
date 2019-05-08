#' @title Find persons by name
#' @description Function to Find persons by name from pipedrive.
#' @param term Search term to look for
#' @param org_id ID of the organization person is associated with.
#' @param start Pagination start
#' @param limit Items shown per page
#' @param search_by_email When enabled, term will only be matched against email addresses of people. Default: false This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' persons.find(term='e.g.',api_token='token',company_domain='exp')
#' }
persons.find <- function(term, org_id=NULL, start=NULL, limit=NULL, search_by_email=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/persons/find?'
bodyList <- list(term=term,org_id=org_id,start=start,limit=limit,search_by_email=search_by_email)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{term}',term, url, fixed = TRUE)
return(get_all_(url))
}
