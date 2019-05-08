#' @title Get all deals
#' @description Function to Get all deals from pipedrive.
#' @param user_id If supplied, only deals matching the given user will be returned.
#' @param filter_id ID of the filter to use
#' @param stage_id If supplied, only deals within the given stage will be returned.
#' @param status Only fetch deals with specific status. If omitted, all not deleted deals are fetched. This field has the following domains: (open; won; lost; deleted; all_not_deleted)
#' @param start Pagination start
#' @param limit Items shown per page. Default limit is 100, maximum limit is 500.
#' @param sort Field names and sorting mode separated by a comma (field_name_1 ASC, field_name_2 DESC). Only first-level field keys are supported (no nested keys).
#' @param owned_by_you When supplied, only deals owned by you are returned. However filter_id takes precedence over owned_by_you when both are supplied. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' deals.get_all(api_token='token',company_domain='exp')
#' }
deals.get_all <- function(user_id=NULL, filter_id=NULL, stage_id=NULL, status=NULL, start=NULL, limit=NULL, sort=NULL, owned_by_you=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals?'
bodyList <- list(user_id=user_id,filter_id=filter_id,stage_id=stage_id,status=status,start=start,limit=limit,sort=sort,owned_by_you=owned_by_you)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
return(get_all_(url))
}
