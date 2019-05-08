#' @title Get global messages
#' @description Function to Get global messages from pipedrive.
#' @param limit Number of messages to get from 1 to 100. 1 message is returned by default.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' globalmessages.get(api_token='token',company_domain='exp')
#' }
globalmessages.get <- function(limit=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/globalMessages?'
bodyList <- list(limit=limit)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
return(get_all_(url))
}
