#' @title Add a deal
#' @description Function to Add a deal on pipedrive.
#' @param title Deal title
#' @param value Value of the deal. If omitted, value will be set to 0.
#' @param currency Currency of the deal. Accepts a 3-character currency code. If omitted, currency will be set to the default currency of the authorized user.
#' @param user_id ID of the user who will be marked as the owner of this deal. If omitted, the authorized user ID will be used.
#' @param person_id ID of the person this deal will be associated with
#' @param org_id ID of the organization this deal will be associated with
#' @param stage_id ID of the stage this deal will be placed in a pipeline (note that you can't supply the ID of the pipeline as this will be assigned automatically based on stage_id). If omitted, the deal will be placed in the first stage of the default pipeline.
#' @param status open = Open, won = Won, lost = Lost, deleted = Deleted. If omitted, status will be set to open. This field has the following domains: (open; won; lost; deleted)
#' @param probability Deal success probability percentage. Used/shown only when deal_probability for the pipeline of the deal is enabled.
#' @param lost_reason Optional message about why the deal was lost (to be used when status=lost)
#' @param add_time Optional creation date & time of the deal in UTC. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
#' @param visible_to Visibility of the deal. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.1 = Owner & followers (private); 3 = Entire company (shared) This field has the following domains: (1; 3)
#' @param customList List with custom fields. Example: list(`custom_field` = abc)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' deals.add(title='e.g.',api_token='token',company_domain='exp')
#' }
deals.add <- function(title, value=NULL, currency=NULL, user_id=NULL, person_id=NULL, org_id=NULL, stage_id=NULL, status=NULL, probability=NULL, lost_reason=NULL, add_time=NULL, visible_to=NULL, customList=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/deals?'
bodyList <- list(title=title,value=value,currency=currency,user_id=user_id,person_id=person_id,org_id=org_id,stage_id=stage_id,status=status,probability=probability,lost_reason=lost_reason,add_time=add_time,visible_to=visible_to)
if(typeof(customList) == 'list') bodyList <- c(bodyList,customList)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
