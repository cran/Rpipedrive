#' @title Update a product
#' @description Function to Update a product on pipedrive.
#' @param id ID of the product
#' @param name Name of the product.
#' @param code Product code.
#' @param unit Unit in which this product is sold
#' @param tax Tax percentage
#' @param active_flag Whether this product will be made active or not. This field has the following domains: (0; 1)
#' @param visible_to Visibility of the product. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.1 = Owner & followers (private); 3 = Entire company (shared) This field has the following domains: (1; 3)
#' @param owner_id ID of the user who will be marked as the owner of this product. When omitted, the authorized user ID will be used.
#' @param prices Array of objects, each containing: currency (string), price (number), cost (number, optional), overhead_cost (number, optional). Note that there can only be one price per product per currency. When 'prices' is omitted altogether, product pricing will not be changed.
#' @param customList List with custom fields. Example: list(`custom_field` = abc)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' products.update(id='e.g.',api_token='token',company_domain='exp')
#' }
products.update <- function(id, name=NULL, code=NULL, unit=NULL, tax=NULL, active_flag=NULL, visible_to=NULL, owner_id=NULL, prices=NULL, customList=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/products/{id}?'
bodyList <- list(id=id,name=name,code=code,unit=unit,tax=tax,active_flag=active_flag,visible_to=visible_to,owner_id=owner_id,prices=prices)
if(typeof(customList) == 'list') bodyList <- c(bodyList,customList)
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
