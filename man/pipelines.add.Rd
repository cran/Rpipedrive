% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipelines.add.R
\name{pipelines.add}
\alias{pipelines.add}
\title{Add a new pipeline}
\usage{
pipelines.add(name = NULL, deal_probability = NULL, order_nr = NULL,
  active = NULL, api_token = NULL, company_domain = "api",
  return_type = c("complete", "boolean"))
}
\arguments{
\item{name}{Name of the pipeline}

\item{deal_probability}{Whether deal probability is disabled or enabled for this pipeline. This field has the following domains: (0; 1)}

\item{order_nr}{Defines pipelines order. First order(order_nr=0) is the default pipeline.}

\item{active}{Whether this pipeline will be made inactive (hidden) or active This field has the following domains: (0; 1)}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}

\item{return_type}{the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)}
}
\value{
customizable return, the default is an object List
}
\description{
Function to Add a new pipeline on pipedrive.
}
\examples{
\donttest{
pipelines.add(api_token='token',company_domain='exp')
}
}
