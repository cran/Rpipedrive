% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/organizationrelationships.get_all.R
\name{organizationrelationships.get_all}
\alias{organizationrelationships.get_all}
\title{Get all relationships for organization}
\usage{
organizationrelationships.get_all(org_id, api_token = NULL,
  company_domain = "api")
}
\arguments{
\item{org_id}{ID of the organization to get relationships for}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}
}
\value{
return an object List()
}
\description{
Function to Get all relationships for organization from pipedrive.
}
\examples{
\donttest{
organizationrelationships.get_all(org_id='e.g.',api_token='token',company_domain='exp')
}
}
