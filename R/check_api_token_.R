#' @title Checking API Token
#' @description Internal function to check API Token
#' @param api_token To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference
#' @return string
#' @export
#' @examples \dontrun{
#' #Example
#' check_api_token_("sjdfsanm23423")
#' }
check_api_token_ <- function(api_token) {
  if (is.null(api_token)) {
      stop(
        "Please, the field api_token is required, for more information access <https://pipedrive.readme.io/docs/how-to-find-the-api-token>"
      )
  } else {
    return(api_token)
  }
}
