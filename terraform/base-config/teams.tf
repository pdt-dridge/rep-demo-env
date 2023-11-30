/* 
  PagerDuty Team Definition
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/team.html
*/

resource "pagerduty_team" "application_support" {
  name        = "Application Support"
  description = "Application Support Team"
}

resource "pagerduty_team" "database" {
  name        = "Database"
  description = "Database Team"
}

resource "pagerduty_team" "infrastructure" {
  name        = "Infrastructure"
  description = "Infrastructure Team"
}

resource "pagerduty_team" "networking" {
  name        = "Networking"
  description = "Networking Team"
}

resource "pagerduty_team" "security" {
  name        = "Security"
  description = "Security Team"
}

resource "pagerduty_team" "major_incident_management" {
  name        = "Major Incident Management"
  description = "Major Incident Management"
}