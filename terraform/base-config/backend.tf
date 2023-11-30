/* 
  Postgres Backend Provider
  
  This lets you store your state to a remote server, rather than keeping a local copy.
  Note that this will need to be configured via CLI for different environments (e.g. Postgres database per pdt-domain)
*/

terraform {
  required_providers {
    pagerduty = {
      source = "PagerDuty/pagerduty"
    }
  }
}