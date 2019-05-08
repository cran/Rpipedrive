#' @title Update stage details
#' @description Function to Update stage details on pipedrive.
#' @param id ID of the stage
#' @param name Name of the stage
#' @param pipeline_id ID of the pipeline this stage belongs to.
#' @param order_nr An order number for this stage. Order numbers should be used to order the stages in the pipeline.
#' @param deal_probability Deal success probability percentage. Used/shown when deal weighted values are used.
#' @param rotten_flag Whether deals in this stage can become rotten. This field has the following domains: (0; 1)
#' @param rotten_days Number of days the deals not updated in this stage would become rotten. Applies only if rotten_flag is set.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' stages.update(id='e.g.',api_token='token',company_domain='exp')
#' }
stages.update <- function(id, name=NULL, pipeline_id=NULL, order_nr=NULL, deal_probability=NULL, rotten_flag=NULL, rotten_days=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/stages/{id}?'
bodyList <- list(id=id,name=name,pipeline_id=pipeline_id,order_nr=order_nr,deal_probability=deal_probability,rotten_flag=rotten_flag,rotten_days=rotten_days)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::PUT(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
