/* 
  Terraform Variables Definition
*/

/* 
  PagerDuty REST API Token
  This should be passed through the command line or as an environment variable; DO NOT check this into the repo!
  
  For example:
  $ terraform apply -var="PAGERDUTY_TOKEN=TOKEN_HERE"
  
  - or -
  
  $ export TF_VAR_PAGERDUTY_TOKEN=TOKEN_HERE
  $ terraform apply
*/
variable "PAGERDUTY_TOKEN" {
  type    = string
}

/*
  CRUX Bearer Token
*/
# variable "CRUX_TOKEN" {
#   type    = string
#   default = "placeholder"
# }

/*
  CRUX Bearer Token
*/
variable "NAMESET" {
  type    = string
  default = "ecommerce"
}