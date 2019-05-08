#' @title Get deals timeline
#' @description Function to Get deals timeline from pipedrive.
#' @param start_date Date where first interval starts. Format: YYYY-MM-DD
#' @param interval Type of interval.day = Day; week = A full week (7 days) starting from start_date; month = A full month (depending on the number of days in given month) starting from start_date; quarter = A full quarter (3 months) starting from start_date This field has the following domains: (day; week; month; quarter)
#' @param amount Number of given intervals, starting from start_date, to fetch. E.g. 3 (months).
#' @param field_key The name of the date field by which to get deals by.
#' @param user_id If supplied, only deals matching the given user will be returned.
#' @param pipeline_id If supplied, only deals matching the given pipeline will be returned.
#' @param filter_id If supplied, only deals matching the given filter will be returned.
#' @param exclude_deals Whether to exclude deals list (1) or not (0). Note that when deals are excluded, the timeline summary (counts and values) is still returned. This field has the following domains: (0; 1)
#' @param totals_convert_currency 3-letter currency code of any of the supported currencies. When supplied, totals_converted is returned per each interval which contains the currency-converted total amounts in the given currency. You may also set this parameter to 'default_currency' in which case users default currency is used.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' deals.timeline(start_date='e.g.',interval='e.g.',amount='e.g.',field_key='e.g.')
#' }
deals.timeline <- function(start_date, interval, amount, field_key, user_id=NULL, pipeline_id=NULL, filter_id=NULL, exclude_deals=NULL, totals_convert_currency=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals/timeline?'
bodyList <- list(start_date=start_date,interval=interval,amount=amount,field_key=field_key,user_id=user_id,pipeline_id=pipeline_id,filter_id=filter_id,exclude_deals=exclude_deals,totals_convert_currency=totals_convert_currency)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{start_date}',start_date, url, fixed = TRUE)
return(get_all_(url))
}
