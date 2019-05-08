#' @title Get deals in a pipeline
#' @description Function to Get deals in a pipeline from pipedrive.
#' @param id ID of the pipeline to fetch.
#' @param filter_id If supplied, only deals matching the given filter will be returned.
#' @param user_id If supplied, filter_id will not be considered and only deals owned by the given user will be returned. If omitted, deals owned by the authorized user will be returned.
#' @param everyone If supplied, filter_id and user_id will not be considered  instead, deals owned by everyone will be returned. This field has the following domains: (0; 1)
#' @param stage_id If supplied, only deals within the given stage will be returned.
#' @param start Pagination start
#' @param limit Items shown per page
#' @param get_summary Whether to include summary of the pipeline in the additional_data or not. This field has the following domains: (0; 1)
#' @param totals_convert_currency 3-letter currency code of any of the supported currencies. When supplied, per_stages_converted is returned inside deals_summary inside additional_data which contains the currency-converted total amounts in the given currency per each stage. You may also set this parameter to 'default_currency' in which case users default currency is used. Only works when get_summary parameter flag is enabled.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' pipelines.get.deals(id='e.g.',api_token='token',company_domain='exp')
#' }
pipelines.get.deals <- function(id, filter_id=NULL, user_id=NULL, everyone=NULL, stage_id=NULL, start=NULL, limit=NULL, get_summary=NULL, totals_convert_currency=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/pipelines/{id}/deals?'
bodyList <- list(id=id,filter_id=filter_id,user_id=user_id,everyone=everyone,stage_id=stage_id,start=start,limit=limit,get_summary=get_summary,totals_convert_currency=totals_convert_currency)
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
