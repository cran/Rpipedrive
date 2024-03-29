% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webhooks.add.R
\name{webhooks.add}
\alias{webhooks.add}
\title{Create a new webhook}
\usage{
webhooks.add(subscription_url, event_action, event_object,
  user_id = NULL, http_auth_user = NULL, http_auth_password = NULL,
  api_token = NULL, company_domain = "api",
  return_type = c("complete", "boolean"))
}
\arguments{
\item{subscription_url}{A full, valid, publicly accessible URL. Determines where to send the notifications. Please note that you cannot use Pipedrive API endpoints as the subscription_url.}

\item{event_action}{Type of action to receive notifications about. Wildcard will match all supported actions. This field has the following domains: (added; updated; merged; deleted; *)}

\item{event_object}{Type of object to receive notifications about. Wildcard will match all supported objects. This field has the following domains: (activity; activityType; deal; note; organization; person; pipeline; product; stage; user; *)}

\item{user_id}{ID of the user this webhook will be authorized with. If not set, current authorized user will be used. Note that this does not filter only certain user's events  rather, this specifies the user's permissions under which each event is checked. Events about objects the selected user is not entitled to access are not sent. If you want to receive notifications for all events, a top-level admin user should be used.}

\item{http_auth_user}{HTTP basic auth username of the subscription URL endpoint (if required).}

\item{http_auth_password}{HTTP basic auth password of the subscription URL endpoint (if required).}

\item{api_token}{To validate your requests, you'll need your api_token - this means that our system will need to know who you are and be able to connect all actions you do with your chosen Pipedrive account. Have in mind that a user has a different api_token for each company. Please access the following link for more information: <https://pipedrive.readme.io/docs/how-to-find-the-api-token?utm_source=api_reference>}

\item{company_domain}{How to get the company domain: <https://pipedrive.readme.io/docs/how-to-get-the-company-domain>}

\item{return_type}{the default return is an object List with all informations of process, or you can set boolean (TRUE = success, FALSE = error)}
}
\value{
customizable return, the default is an object List
}
\description{
Function to Create a new webhook on pipedrive.
}
\examples{
\donttest{
webhooks.add(subscription_url='e.g.',event_action='e.g.',event_object='e.g.')
}
}
