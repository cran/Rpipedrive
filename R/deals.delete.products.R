#' @title Delete an attached product from a deal
#' @description Function to Delete an attached product from a deal on pipedrive.
#' @param id ID of the deal
#' @param product_attachment_id Product attachment ID. This is returned as product_attachment_id after attaching a product to a deal or as id when listing the products attached to a deal.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' deals.delete.products(id='e.g.',product_attachment_id='e.g.')
#' }
deals.delete.products <- function(id, product_attachment_id, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals/{id}/products/{product_attachment_id}?'
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
url <- sub('{product_attachment_id}',product_attachment_id, url, fixed = TRUE)
r <- httr::DELETE(url)
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
