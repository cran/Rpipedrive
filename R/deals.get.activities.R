#' @title List activities associated with a deal
#' @description Function to List activities associated with a deal from pipedrive.
#' @param id ID of the deal
#' @param start Pagination start
#' @param limit Items shown per page
#' @param done Whether to fetch done (1) or undone (0) activities. If omitted from request, both undone and done activities are fetched. This field has the following domains: (0; 1)
#' @param exclude A comma-separated string of activity IDs to exclude from result
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' deals.get.activities(id='e.g.',api_token='token',company_domain='exp')
#' }
deals.get.activities <- function(id, start=NULL, limit=NULL, done=NULL, exclude=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals/{id}/activities?'
bodyList <- list(id=id,start=start,limit=limit,done=done,exclude=exclude)
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
