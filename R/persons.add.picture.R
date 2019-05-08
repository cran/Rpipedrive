#' @title Add person picture
#' @description Function to Add person picture on pipedrive.
#' @param id ID of the person
#' @param file One image supplied in the multipart/form-data encoding.
#' @param crop_x X coordinate to where start cropping form (in pixels)
#' @param crop_y Y coordinate to where start cropping form (in pixels)
#' @param crop_width Width of cropping area (in pixels)
#' @param crop_height Height of cropping area (in pixels)
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' persons.add.picture(id='e.g.',file='e.g.',api_token='token',company_domain='exp')
#' }
persons.add.picture <- function(id, file, crop_x=NULL, crop_y=NULL, crop_width=NULL, crop_height=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/persons/{id}/picture?'
bodyList <- list(id=id,file=file,crop_x=crop_x,crop_y=crop_y,crop_width=crop_width,crop_height=crop_height)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
url <- sub('{id}',id, url, fixed = TRUE)
bodyList$id <- NULL
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
