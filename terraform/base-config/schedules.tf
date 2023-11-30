/* 
  PagerDuty Schedules (see users.tf)
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/schedule.html
*/

locals {
  week_in_seconds         = 604800
  rotation_start          = join("T", ["2020-11-16", "08:00:00+00:00"])
  rotation_virtual_start  = join("T", ["2020-11-16", "08:00:00+00:00"])
}

locals {
  weekly_schedules = [
    {
      name    = pagerduty_team.application_support.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "Ariel White"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Kate Miller"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Rob Smith"][0]
      ]
    },
    {
      name    = pagerduty_team.database.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "Edward Roper"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Sarah Lance"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Alex Baker"][0]
      ]
    },
    {
      name    = pagerduty_team.infrastructure.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "Tyson Grey"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Chelsea West"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Jamie Todd"][0]
      ]
    },
    {
      name    = pagerduty_team.networking.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "Terry Chan"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Lance Coombes"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Leo Frith"][0]
      ]
    },
    {
      name    = pagerduty_team.security.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "Danny Thompson"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Thomas Burton"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Grayson Williams"][0]
      ]
    },
    {
      name    = pagerduty_team.major_incident_management.name
      manager = [[for user in pagerduty_user.users: user.id if user.name == "David Seaborne"][0]]
      users   = [
        [for user in pagerduty_user.users: user.id if user.name == "Alex Contreras"][0],
        [for user in pagerduty_user.users: user.id if user.name == "Rhian Roy"][0]
      ]
    }                   
  ]
}

resource "pagerduty_schedule" "weekly_primary" {
  count     = length(local.weekly_schedules)
  name      = join(" - ", [local.weekly_schedules[count.index].name, "Primary"])
  time_zone = "Europe/London"
  layer {
    name                         = "Weekly Rotation"
    start                        = local.rotation_start
    rotation_virtual_start       = local.rotation_virtual_start
    rotation_turn_length_seconds = local.week_in_seconds
    users                        = local.weekly_schedules[count.index].users
  }
}

resource "pagerduty_schedule" "weekly_secondary" {
  count     = length(local.weekly_schedules)
  name      = join(" - ", [local.weekly_schedules[count.index].name, "Secondary"])
  time_zone = "Europe/London"
  layer {
    name                         = "Weekly Rotation"
    start                        = local.rotation_start
    rotation_virtual_start       = local.rotation_virtual_start
    rotation_turn_length_seconds = local.week_in_seconds
    # We can reverse array to create secondary schedule (assuming even number of users)
    users                        = reverse(local.weekly_schedules[count.index].users)
  }
}

resource "pagerduty_schedule" "weekly_manager" {
  count     = length(local.weekly_schedules)
  name      = join(" - ", [local.weekly_schedules[count.index].name, "Manager"])
  time_zone = "Europe/London"
  layer {
    name                         = "Weekly Rotation"
    start                        = local.rotation_start
    rotation_virtual_start       = local.rotation_virtual_start
    rotation_turn_length_seconds = local.week_in_seconds
    users                        = local.weekly_schedules[count.index].manager
  }
}