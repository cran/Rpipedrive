#' @title Get deals movements in pipeline
#' @description Function to Get deals movements in pipeline from pipedrive.
#' @param id ID of the pipeline.
#' @param start_date Start of the period. Date in format of YYYY-MM-DD.
#' @param end_date End of the period. Date in format of YYYY-MM-DD.
#' @param user_id ID of the user who's pipeline statistics to fetch. If omitted, the authorized user will be used.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @return return an object List()
#' @export
#' @examples \donttest{
#' pipelines.get.movement_statistics(id='e.g.',start_date='e.g.',end_date='e.g.')
#' }
pipelines.get.movement_statistics <- function(id, start_date, end_date, user_id=NULL, api_token=NULL, company_domain='api'){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/pipelines/{id}/movement_statistics?'
bodyList <- list(id=id,start_date=start_date,end_date=end_date,user_id=user_id)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
return(get_all_(url))
}
