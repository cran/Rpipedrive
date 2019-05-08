#' @title Add file
#' @description Function to Add file on pipedrive.
#' @param file Path and name of file that you want to upload. The default path is work directory.
#' @param deal_id ID of the deal to associate file(s) with.
#' @param person_id ID of the person to associate file(s) with.
#' @param org_id ID of the organization to associate file(s) with.
#' @param product_id ID of the product to associate file(s) with.
#' @param activity_id ID of the activity to associate file(s) with.
#' @param note_id ID of the note to associate file(s) with.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' files.add(file='e.g.',api_token='token',company_domain='exp')
#' }
files.add <- function(file, deal_id=NULL, person_id=NULL, org_id=NULL, product_id=NULL, activity_id=NULL, note_id=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/files?'
file <- httr::upload_file(file)
bodyList <- list(file=file,deal_id=deal_id,person_id=person_id,org_id=org_id,product_id=product_id,activity_id=activity_id,note_id=note_id)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList)
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
