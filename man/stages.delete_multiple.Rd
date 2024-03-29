% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stages.delete_multiple.R
\name{stages.delete_multiple}
\alias{stages.delete_multiple}
\title{Delete multiple stages in bulk}
\usage{
stages.delete_multiple(ids, api_token = NULL, company_domain = "api",
  return_type = c("complete", "boolean"))
}
\arguments{
\item{ids}{Comma-separated stage IDs to delete}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}

\item{return_type}{the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)}
}
\value{
customizable return, the default is an object List
}
\description{
Function to Delete multiple stages in bulk on pipedrive.
}
\examples{
\donttest{
stages.delete_multiple(ids='e.g.',api_token='token',company_domain='exp')
}
}
