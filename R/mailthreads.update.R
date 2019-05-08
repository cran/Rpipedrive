#' @title Update mail thread details
#' @description Function to Update mail thread details on pipedrive.
#' @param id ID of the mail thread
#' @param deal_id ID of the deal this thread is associated with
#' @param shared_flag Whether this thread is shared with other users in your company This field has the following domains: (0; 1)
#' @param read_flag Whether this thread read or unread This field has the following domains: (0; 1)
#' @param archived_flag Whether this thread is archived or not. You can only archive threads that belong to Inbox folder. Archived threads will disappear from Inbox. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' mailthreads.update(id='e.g.',api_token='token',company_domain='exp')
#' }
mailthreads.update <- function(id, deal_id=NULL, shared_flag=NULL, read_flag=NULL, archived_flag=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/mailbox/mailThreads/{id}?'
bodyList <- list(id=id,deal_id=deal_id,shared_flag=shared_flag,read_flag=read_flag,archived_flag=archived_flag)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::PUT(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
