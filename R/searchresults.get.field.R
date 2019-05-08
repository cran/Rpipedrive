#' @title Perform a search using a specific field value
#' @description Function to Perform a search using a specific field value from pipedrive.
#' @param term Search term to look for, minimum 2 characters.
#' @param exact_match When enabled, only full exact matches against the given term are returned. By default, term can be present anywhere in the resulting field values to be considered a match. The minimum 2 character limit for the term is discarded when exact_match is enabled. This field has the following domains: (0; 1)
#' @param field_type Type of the field to perform the search from. This field has the following domains: (dealField; personField; organizationField; productField)
#' @param field_key Key of the field to search from. Field key can be obtained by fetching the list of fields using any of fields API GET methods (dealFields, personFields, ..).
#' @param return_field_key Name of the field in search results from which the search was performed. When omitted, 'value' will be used. You may want to set this parameter to match the field_key.
#' @param return_item_ids Whether to return matching items IDs in search results. When omitted or set to 0, only distinct values of the searched field are returned. When enabled, the return_field_key parameter is ignored and the results include the searched field as its own key. This field has the following domains: (0; 1)
#' @param start Pagination start
#' @param limit Items shown per page
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' searchresults.get.field(term='e.g.',field_type='e.g.',field_key='e.g.')
#' }
searchresults.get.field <- function(term, field_type, field_key, exact_match=NULL, return_field_key=NULL, return_item_ids=NULL, start=NULL, limit=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/searchResults/field?'
bodyList <- list(term=term,exact_match=exact_match,field_type=field_type,field_key=field_key,return_field_key=return_field_key,return_item_ids=return_item_ids,start=start,limit=limit)
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
