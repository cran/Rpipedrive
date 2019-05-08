#' @title List and filter activities assigned to a specific user
#' @description Function to List and filter activities assigned to a specific user from pipedrive.
#' @param id ID of the user
#' @param due_date Either a due date in YYYY-MM-DD format, or one of the following: all, overdue, today, tomorrow, this_week, next_week
#' @param type Filter activities based on ActivityType's key_string (examples: call, meeting)
#' @param start Pagination start
#' @param limit Items shown per page
#' @param done Whether to fetch done (1) or undone (0) activities. If omitted from request, both undone and done activities are fetched. This field has the following domains: (0; 1)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' users.get.activities(id='e.g.',api_token='token',company_domain='exp')
#' }
users.get.activities <- function(id, due_date=NULL, type=NULL, start=NULL, limit=NULL, done=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/users/{id}/activities?'
bodyList <- list(id=id,due_date=due_date,type=type,start=start,limit=limit,done=done)
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
