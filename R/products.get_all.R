#' @title Get all products
#' @description Function to Get all products from pipedrive.
#' @param user_id If supplied, only products owned by the given user will be returned.
#' @param filter_id ID of the filter to use
#' @param first_char If supplied, only products whose name starts with the specified letter will be returned (case insensitive).
#' @param start Pagination start
#' @param limit Items shown per page
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' products.get_all(api_token='token',company_domain='exp')
#' }
products.get_all <- function(user_id=NULL, filter_id=NULL, first_char=NULL, start=NULL, limit=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/products?'
bodyList <- list(user_id=user_id,filter_id=filter_id,first_char=first_char,start=start,limit=limit)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
return(get_all_(url))
}
