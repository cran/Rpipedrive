#' @title Download one file
#' @description Function to Download one file from pipedrive.
#' @param id ID of the file to download.
#' @param save File name that you wish save, the default path is Work Directory, you can put full path (path + file name) to save where you want
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' files.get.download(id='e.g.',save='e.g.',api_token='token',company_domain='exp')
#' }
files.get.download <- function(id, save, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/files/{id}/download?'
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
utils::download.file(url, destfile = save, mode = 'wb')
}
