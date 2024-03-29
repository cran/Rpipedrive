% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/organizations.delete.followers.R
\name{organizations.delete.followers}
\alias{organizations.delete.followers}
\title{Delete a follower from an organization}
\usage{
organizations.delete.followers(id, follower_id, api_token = NULL,
  company_domain = "api", return_type = c("complete", "boolean"))
}
\arguments{
\item{id}{ID of the organization}

\item{follower_id}{ID of the follower}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}

\item{return_type}{the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)}
}
\value{
customizable return, the default is an object List
}
\description{
Function to Delete a follower from an organization on pipedrive.
}
\examples{
\donttest{
organizations.delete.followers(id='e.g.',follower_id='e.g.',api_token='token',company_domain='exp')
}
}
