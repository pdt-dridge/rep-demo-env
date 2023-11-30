/* 
  PagerDuty Escalation Policies (see users.tf and schedules.tf)
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/escalation_policy.html
*/

locals {
  escalation_num_loops            = 3
  escalation_delay_in_minutes_L1  = 10
  escalation_delay_in_minutes_L2  = 25
  escalation_delay_in_minutes_L3  = 30
}

locals {
  escalation_policies = [
    { team = pagerduty_team.application_support },
    { team = pagerduty_team.database },
    { team = pagerduty_team.infrastructure },
    { team = pagerduty_team.networking },
    { team = pagerduty_team.security },
    { team = pagerduty_team.major_incident_management }
  ]
}

resource "pagerduty_escalation_policy" "team_escalation_policies" {
  count     = length(local.escalation_policies)
  name      = join(" ", [local.escalation_policies[count.index].team.name, "(EP)"])
  num_loops = local.escalation_num_loops
  teams     = [local.escalation_policies[count.index].team.id]
  rule {
    escalation_delay_in_minutes = local.escalation_delay_in_minutes_L1
    target {
      type = "schedule_reference"
      id   = [for schedule in pagerduty_schedule.weekly_primary: schedule.id if schedule.name == join(" - ", [local.escalation_policies[count.index].team.name, "Primary"])][0]
    }
  }
  rule {
    escalation_delay_in_minutes = local.escalation_delay_in_minutes_L2
    target {
      type = "schedule_reference"
      id   = [for schedule in pagerduty_schedule.weekly_secondary: schedule.id if schedule.name == join(" - ", [local.escalation_policies[count.index].team.name, "Secondary"])][0]
    }
  }
  rule {
    escalation_delay_in_minutes = local.escalation_delay_in_minutes_L3
    target {
      type = "schedule_reference"
      id   = [for schedule in pagerduty_schedule.weekly_manager: schedule.id if schedule.name == join(" - ", [local.escalation_policies[count.index].team.name, "Manager"])][0]
    }
  }
}