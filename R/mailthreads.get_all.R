#' @title Get mail threads
#' @description Function to Get mail threads from pipedrive.
#' @param folder Type of folder to fetch. This field has the following domains: (inbox; drafts; sent; archive)
#' @param start Index of the first item. If not set, then equals 0.
#' @param limit Amount of threads to fetch. If not set, then equals 50.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' mailthreads.get_all(folder='e.g.',api_token='token',company_domain='exp')
#' }
mailthreads.get_all <- function(folder, start=NULL, limit=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/mailbox/mailThreads?'
bodyList <- list(folder=folder,start=start,limit=limit)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{folder}',folder, url, fixed = TRUE)
return(get_all_(url))
}
