% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/products.get.deals.R
\name{products.get.deals}
\alias{products.get.deals}
\title{Get deals where a product is attached to}
\usage{
products.get.deals(id, start = NULL, limit = NULL, status = NULL,
  api_token = NULL, company_domain = "api")
}
\arguments{
\item{id}{ID of the product}

\item{start}{Pagination start}

\item{limit}{Items shown per page}

\item{status}{Only fetch deals with specific status. If omitted, all not deleted deals are fetched. This field has the following domains: (open; won; lost; deleted; all_not_deleted)}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}
}
\value{
return an object List()
}
\description{
Function to Get deals where a product is attached to from pipedrive.
}
\examples{
\donttest{
products.get.deals(id='e.g.',api_token='token',company_domain='exp')
}
}
