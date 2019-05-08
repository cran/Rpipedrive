#' @title Create a new webhook
#' @description Function to Create a new webhook on pipedrive.
#' @param subscription_url A full, valid, publicly accessible URL. Determines where to send the notifications. Please note that you cannot use Pipedrive API endpoints as the subscription_url.
#' @param event_action Type of action to receive notifications about. Wildcard will match all supported actions. This field has the following domains: (added; updated; merged; deleted; *)
#' @param event_object Type of object to receive notifications about. Wildcard will match all supported objects. This field has the following domains: (activity; activityType; deal; note; organization; person; pipeline; product; stage; user; *)
#' @param user_id ID of the user this webhook will be authorized with. If not set, current authorized user will be used. Note that this does not filter only certain user's events  rather, this specifies the user's permissions under which each event is checked. Events about objects the selected user is not entitled to access are not sent. If you want to receive notifications for all events, a top-level admin user should be used.
#' @param http_auth_user HTTP basic auth username of the subscription URL endpoint (if required).
#' @param http_auth_password HTTP basic auth password of the subscription URL endpoint (if required).
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' webhooks.add(subscription_url='e.g.',event_action='e.g.',event_object='e.g.')
#' }
webhooks.add <- function(subscription_url, event_action, event_object, user_id=NULL, http_auth_user=NULL, http_auth_password=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/webhooks?'
bodyList <- list(subscription_url=subscription_url,event_action=event_action,event_object=event_object,user_id=user_id,http_auth_user=http_auth_user,http_auth_password=http_auth_password)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
