#' @title List files attached to a product
#' @description Function to List files attached to a product from pipedrive.
#' @param id ID of the product
#' @param start Pagination start
#' @param limit Items shown per page
#' @param include_deleted_files When enabled, the list of files will also include deleted files. Please note that trying to download these files will not work. This field has the following domains: (0; 1)
#' @param sort Field names and sorting mode separated by a comma (field_name_1 ASC, field_name_2 DESC). Only first-level field keys are supported (no nested keys). Supported fields: id, user_id, deal_id, person_id, org_id, product_id, add_time, update_time, file_name, file_type, file_size, comment.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' products.get.files(id='e.g.',api_token='token',company_domain='exp')
#' }
products.get.files <- function(id, start=NULL, limit=NULL, include_deleted_files=NULL, sort=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/products/{id}/files?'
bodyList <- list(id=id,start=start,limit=limit,include_deleted_files=include_deleted_files,sort=sort)
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
