#' @title Add new activity type
#' @description Function to Add new activity type on pipedrive.
#' @param name Name of the activity type
#' @param icon_key Icon graphic to use for representing this activity type. This field has the following domains: (task; email; meeting; deadline; call; lunch; calendar; downarrow; document; smartphone; camera; scissors; cogs; bubble; uparrow; checkbox; signpost; shuffle; addressbook; linegraph; picture; car; world; search; clip; sound; brush; key; padlock; pricetag; suitcase; finish; plane; loop; wifi; truck; cart; bulb; bell; presentation)
#' @param color A designated color for the activity type in 6-character HEX format (e.g. FFFFFF for white, 000000 for black).
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' activitytypes.add(name='e.g.',icon_key='e.g.',api_token='token',company_domain='exp')
#' }
activitytypes.add <- function(name, icon_key, color=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/activityTypes?'
bodyList <- list(name=name,icon_key=icon_key,color=color)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
