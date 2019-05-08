#' @title Add a new person field
#' @description Function to Add a new person field on pipedrive.
#' @param name Name of the field
#' @param field_type Type of the field.varchar = Text (up to 255 characters); varchar_auto = Autocomplete text (up to 255 characters); text = Long text (up to 65k characters); double = Numeric value; monetary = Monetary field (has a numeric value and a currency value); date = Date (format YYYY-MM-DD); set = Options field with a possibility of having multiple chosen options; enum = Options field with a single possible chosen option; user = User field (contains a user ID of another Pipedrive user); org = Organization field (contains an organization ID which is stored on the same account); people = Person field (contains a person ID which is stored on the same account); phone = Phone field (up to 255 numbers and/or characters); time = Time field (format HH:MM:SS); timerange = Time-range field (has a start time and end time value, both HH:MM:SS); daterange = Date-range field (has a start date and end date value, both YYYY-MM-DD) This field has the following domains: (varchar; varchar_auto; text; double; monetary; date; set; enum; user; org; people; phone; time; timerange; daterange)
#' @param options When field_type is either set or enum, possible options must be supplied as a JSON-encoded sequential array, for example: [red,blue,lilac] this field must be a JSON.
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>
#' @param company_domain How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>
#' @param return_type the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)
#' @return customizable return, the default is an object List
#' @export
#' @examples \donttest{
#' personfields.add(name='e.g.',field_type='e.g.',api_token='token',company_domain='exp')
#' }
personfields.add <- function(name, field_type, options=NULL, api_token=NULL, company_domain='api', return_type = c('complete','boolean')){
api_token <- check_api_token_(api_token)
url <- 'https://{company_domain}.pipedrive.com/v1/personFields?'
bodyList <- list(name=name,field_type=field_type,options=options)
bodyList <- clear_list_(bodyList)
url <- sub('{company_domain}',company_domain, url, fixed = TRUE)
url <- paste0(url, 'api_token={api_token}')
url <- sub('{api_token}',api_token, url, fixed = TRUE)
r <- httr::POST(url,  body = bodyList, encode = 'json')
if(return_type[1] == 'boolean'){
if(r$status_code %in% c(200,201)){return(TRUE)}else{return(FALSE)}
}else{return(r)}
}
