#' @title Get all activities assigned to a particular user
#' @description Function to Get all activities assigned to a particular user from pipedrive.
#' @param user_id ID of the user whose activities will be fetched. If omitted, the user associated with the API token will be used. If 0, activities for all company users will be fetched based on the permission sets.
#' @param filter_id ID of the filter to use (will narrow down results if used together with user_id parameter).
#' @param type Type of the activity, can be one type or multiple types separated by a comma. This is in correlation with the key_string parameter of ActivityTypes.
#' @param start Pagination start
#' @param limit Items shown per page
#' @param start_date Date in format of YYYY-MM-DD from which activities to fetch from.
#' @param end_date Date in format of YYYY-MM-DD until which activities to fetch to.
#' @param done Whether the activity is done or not. 0 = Not done, 1 = Done. If omitted returns both Done and Not done. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' activities.get_all(api_token='token',company_domain='exp')
#' }
activities.get_all <- function(user_id=NULL, filter_id=NULL, type=NULL, start=NULL, limit=NULL, start_date=NULL, end_date=NULL, done=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/activities?'
bodyList <- list(user_id=user_id,filter_id=filter_id,type=type,start=start,limit=limit,start_date=start_date,end_date=end_date,done=done)
bodyList$limit <- ifelse(is.null(limit), 500, limit)
bodyList$start <- ifelse(is.null(start), 0, start)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
return(get_all_(url))
}
