#' @title Add an activity
#' @description Function to Add an activity on pipedrive.
#' @param subject Subject of the activity
#' @param done Whether the activity is done or not. 0 = Not done, 1 = Done This field has the following domains: (0; 1)
#' @param type Type of the activity. This is in correlation with the key_string parameter of ActivityTypes.
#' @param due_date Due date of the activity. Format: YYYY-MM-DD
#' @param due_time Due time of the activity in UTC. Format: HH:MM
#' @param duration Duration of the activity. Format: HH:MM
#' @param user_id ID of the user whom the activity will be assigned to. If omitted, the activity will be assigned to the authorized user.
#' @param deal_id ID of the deal this activity will be associated with
#' @param person_id ID of the person this activity will be associated with
#' @param participants List of multiple persons (participants) this activity will be associated with. If omitted, single participant from person_id field is used. It requires a structure as follows: [{person_id:1,primary_flag:true}] this field must be a JSON.
#' @param org_id ID of the organization this activity will be associated with
#' @param note Note of the activity (HTML format)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' activities.add(subject='e.g.',type='e.g.',api_token='token',company_domain='exp')
#' }
activities.add <- function(subject, type, done=NULL, due_date=NULL, due_time=NULL, duration=NULL, user_id=NULL, deal_id=NULL, person_id=NULL, participants=NULL, org_id=NULL, note=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/activities?'
bodyList <- list(subject=subject,done=done,type=type,due_date=due_date,due_time=due_time,duration=duration,user_id=user_id,deal_id=deal_id,person_id=person_id,participants=participants,org_id=org_id,note=note)
bodyList <- clear_list_(bodyList)
url <- paste0(url,prepare_url_parameters_(bodyList))
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
