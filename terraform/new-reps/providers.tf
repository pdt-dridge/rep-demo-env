/* 
  PagerDuty Terraform Provider
*/

provider "pagerduty" {
  token = var.PAGERDUTY_TOKEN
}


# /* 
#   Add PagerDuty Subdomain to CRUX
# */
# resource "null_resource" "crux-domain" {
	
#   provisioner "local-exec" {
#     command = "/bin/bash ../crux-api/crux-init.sh ${var.CRUX_TOKEN} ${var.PAGERDUTY_DOMAIN} ${var.PAGERDUTY_TOKEN}"
#   }
  
# }