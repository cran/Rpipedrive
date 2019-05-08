#' @title Add a product to the deal, eventually creating a new item called a deal-product.
#' @description Function to Add a product to the deal, eventually creating a new item called a deal-product. on pipedrive.
#' @param id ID of the deal
#' @param product_id ID of the product that will be attached
#' @param item_price Price at which this product will be added to the deal
#' @param quantity Quantity  e.g. how many items of this product will be added to the deal
#' @param discount_percentage Discount percent. If omitted, will be set to 0
#' @param duration Duration of the product (when product durations are not enabled for the company or if omitted, defaults to 1)
#' @param product_variation_id ID of the product variation to use. When omitted, no variation will be used.
#' @param comments Any textual comment associated with this product-deal attachment. Visible and editable in the application UI.
#' @param enabled_flag Whether the product is enabled on the deal or not. This makes it possible to add products to a deal with specific price and discount criteria - but keep them disabled, which refrains them from being included in deal price calculation. When omitted, the product will be marked as enabled by default. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' deals.add.products(id='e.g.',product_id='e.g.',item_price='e.g.',quantity='e.g.')
#' }
deals.add.products <- function(id, product_id, item_price, quantity, discount_percentage=NULL, duration=NULL, product_variation_id=NULL, comments=NULL, enabled_flag=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals/{id}/products?'
bodyList <- list(id=id,product_id=product_id,item_price=item_price,quantity=quantity,discount_percentage=discount_percentage,duration=duration,product_variation_id=product_variation_id,comments=comments,enabled_flag=enabled_flag)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
