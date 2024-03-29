% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stages.add.R
\name{stages.add}
\alias{stages.add}
\title{Add a new stage}
\usage{
stages.add(name, pipeline_id, deal_probability = NULL,
  rotten_flag = NULL, rotten_days = NULL, api_token = NULL,
  company_domain = "api", return_type = c("complete", "boolean"))
}
\arguments{
\item{name}{Name of the stage}

\item{pipeline_id}{ID of the pipeline to add stage to.}

\item{deal_probability}{Deal success probability percentage. Used/shown when deal weighted values are used.}

\item{rotten_flag}{Whether deals in this stage can become rotten. This field has the following domains: (0; 1)}

\item{rotten_days}{Number of days the deals not updated in this stage would become rotten. Applies only if rotten_flag is set.}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}

\item{return_type}{the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)}
}
\value{
customizable return, the default is an object List
}
\description{
Function to Add a new stage on pipedrive.
}
\examples{
\donttest{
stages.add(name='e.g.',pipeline_id='e.g.',api_token='token',company_domain='exp')
}
}
