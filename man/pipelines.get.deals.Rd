% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipelines.get.deals.R
\name{pipelines.get.deals}
\alias{pipelines.get.deals}
\title{Get deals in a pipeline}
\usage{
pipelines.get.deals(id, filter_id = NULL, user_id = NULL,
  everyone = NULL, stage_id = NULL, start = NULL, limit = NULL,
  get_summary = NULL, totals_convert_currency = NULL,
  api_token = NULL, company_domain = "api")
}
\arguments{
\item{id}{ID of the pipeline to fetch.}

\item{filter_id}{If supplied, only deals matching the given filter will be returned.}

\item{user_id}{If supplied, filter_id will not be considered and only deals owned by the given user will be returned. If omitted, deals owned by the authorized user will be returned.}

\item{everyone}{If supplied, filter_id and user_id will not be considered  instead, deals owned by everyone will be returned. This field has the following domains: (0; 1)}

\item{stage_id}{If supplied, only deals within the given stage will be returned.}

\item{start}{Pagination start}

\item{limit}{Items shown per page}

\item{get_summary}{Whether to include summary of the pipeline in the additional_data or not. This field has the following domains: (0; 1)}

\item{totals_convert_currency}{3-letter currency code of any of the supported currencies. When supplied, per_stages_converted is returned inside deals_summary inside additional_data which contains the currency-converted total amounts in the given currency per each stage. You may also set this parameter to 'default_currency' in which case users default currency is used. Only works when get_summary parameter flag is enabled.}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}
}
\value{
return an object List()
}
\description{
Function to Get deals in a pipeline from pipedrive.
}
\examples{
\donttest{
pipelines.get.deals(id='e.g.',api_token='token',company_domain='exp')
}
}
