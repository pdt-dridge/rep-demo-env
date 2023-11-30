/* 
  PagerDuty Services, Integrations, Dependencies, and Maintenance Windows
  - https://www.terraform.io/docs/providers/pagerduty/r/business_service.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service_dependency.html
  - https://www.terraform.io/docs/providers/pagerduty/r/service_integration.html
  - https://www.terraform.io/docs/providers/pagerduty/r/maintenance_window.html
*/

/* 
  Business Services (e.g. higher-level business application)
*/
resource "pagerduty_business_service" "business_service_1" {
  name             = local.nameset.BS_1.name
  description      = local.nameset.BS_1.description
}

resource "pagerduty_business_service" "business_service_2" {
  name             = local.nameset.BS_2.name
  description      = local.nameset.BS_2.description
}

resource "pagerduty_business_service" "business_service_3" {
  name             = local.nameset.BS_3.name
  description      = local.nameset.BS_3.description
}

resource "pagerduty_business_service" "business_service_4" {
  name             = local.nameset.BS_4.name
  description      = local.nameset.BS_4.description
}

resource "pagerduty_business_service" "business_service_5" {
  name             = local.nameset.BS_5.name
  description      = local.nameset.BS_5.description
}

/* 
  Technical Services (e.g. lower-level microservices)
*/
resource "pagerduty_service" "tech_service_1a" {
  name                    = local.nameset.TS_1A
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Application Support (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  alert_grouping_parameters {
    type    = "intelligent"
  }
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_1b" {
  name                    = local.nameset.TS_1B
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Database (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  alert_grouping_parameters {
    type    = "content_based"
    config {
      aggregate   = "all"
      fields      = ["summary"]
    }
  }
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_1c" {
  name                    = local.nameset.TS_1C
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Infrastructure (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_2a" {
  name                    = local.nameset.TS_2A
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Database (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_2b" {
  name                    = local.nameset.TS_2B
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Networking (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_3" {
  name                    = local.nameset.TS_3
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Application Support (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_4" {
  name                    = local.nameset.TS_4
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Infrastructure (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

resource "pagerduty_service" "tech_service_5" {
  name                    = local.nameset.TS_5
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = null
  escalation_policy       = [for ep in pagerduty_escalation_policy.team_escalation_policies: ep.id if ep.name == "Security (EP)"][0]
  alert_creation          = "create_alerts_and_incidents"
  incident_urgency_rule {
    type    = "constant"
    urgency = "severity_based"
  }
}

/* 
  Service-Level Integration Keys (Events v2)
*/
resource "pagerduty_service_integration" "tech_service_1a" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1a.id
}

resource "pagerduty_service_integration" "tech_service_1b" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1b.id
}

resource "pagerduty_service_integration" "tech_service_1c" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_1c.id
}

resource "pagerduty_service_integration" "tech_service_2a" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_2a.id
}

resource "pagerduty_service_integration" "tech_service_2b" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_2b.id
}

resource "pagerduty_service_integration" "tech_service_3" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_3.id
}

resource "pagerduty_service_integration" "tech_service_4" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_4.id
}

resource "pagerduty_service_integration" "tech_service_5" {
  name    = "Events API v2"
  type    = "events_api_v2_inbound_integration"
  service = pagerduty_service.tech_service_5.id
}

/* 
  Service Dependencies
*/
resource "pagerduty_service_dependency" "tech_service_1a" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1a.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_1b" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1b.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_1c" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_1.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_1c.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_2a" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_2.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_2a.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_2b" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_2.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_2b.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_3" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_3.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_3.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_4" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_4.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_4.id
      type  = "service"
    }
  }
}

resource "pagerduty_service_dependency" "tech_service_5" {
  dependency {
    dependent_service {
      id    = pagerduty_business_service.business_service_5.id
      type  = "business_service"
    }
    supporting_service {
      id    = pagerduty_service.tech_service_5.id
      type  = "service"
    }
  }
}