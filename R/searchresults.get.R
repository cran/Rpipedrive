#' @title Perform a search
#' @description Function to Perform a search from pipedrive.
#' @param term Search term to look for, minimum 2 characters.
#' @param item_type Search for items of exact type. If omitted, all types of items are searched. This field has the following domains: (deal; person; organization; product; file)
#' @param start Pagination start
#' @param limit Items shown per page
#' @param exact_match When enabled, only full exact matches against the given term are returned. The minimum 2 character limit for the term is discarded when exact_match is enabled. It will only work if search term is 30 characters or less. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' searchresults.get(term='e.g.',api_token='token',company_domain='exp')
#' }
searchresults.get <- function(term, item_type=NULL, start=NULL, limit=NULL, exact_match=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/searchResults?'
bodyList <- list(term=term,item_type=item_type,start=start,limit=limit,exact_match=exact_match)
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
