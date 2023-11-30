/* 
  PagerDuty User Definition
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/user.html
  
  NB: This will be used to generate the respective resources iteratively.
  We use locals as this enables Terraform to dynamically populate team id from resource.

  Caution: The user array only works if additional users are added at the end.
  If users are added inbetween the existing indexes, this will cause inconsistency in the TF state.
*/

locals {
  users = [
    # Application Support
    {
      name      = "Kate Miller"
      email     = "kate_miller@example.com"
      role      = "limited_user"
      team      = pagerduty_team.application_support.id
      team_role = "responder"
    },
    {
      name      = "Rob Smith"
      email     = "rob_smith@example.com"
      role      = "limited_user"
      team      = pagerduty_team.application_support.id
      team_role = "responder"
    },
    {
      name      = "Ariel White"
      email     = "ariel_white@example.com"
      role      = "limited_user"
      team      = pagerduty_team.application_support.id
      team_role = "manager"
    },

    # Database
    {
      name      = "Sarah Lance"
      email     = "sarah_lance@example.com"
      role      = "limited_user"
      team      = pagerduty_team.database.id
      team_role = "responder"
    },
    {
      name      = "Alex Baker"
      email     = "alex_baker@example.com"
      role      = "limited_user"
      team      = pagerduty_team.database.id
      team_role = "responder"
    },
    {
      name      = "Edward Roper"
      email     = "edward_roper@example.com"
      role      = "limited_user"
      team      = pagerduty_team.database.id
      team_role = "manager"
    },

    # Infrastructure
    {
      name      = "Chelsea West"
      email     = "chelsea_west@example.com"
      role      = "limited_user"
      team      = pagerduty_team.infrastructure.id
      team_role = "responder"
    },
    {
      name      = "Jamie Todd"
      email     = "jamie_todd@example.com"
      role      = "limited_user"
      team      = pagerduty_team.infrastructure.id
      team_role = "responder"
    },
    {
      name      = "Tyson Grey"
      email     = "tyson_grey@example.com"
      role      = "limited_user"
      team      = pagerduty_team.infrastructure.id
      team_role = "manager"
    },

    # Networking
    {
      name      = "Lance Coombes"
      email     = "lance_coombes@example.com"
      role      = "limited_user"
      team      = pagerduty_team.networking.id
      team_role = "responder"
    },
    {
      name      = "Leo Frith"
      email     = "leo_frith@example.com"
      role      = "limited_user"
      team      = pagerduty_team.networking.id
      team_role = "responder"
    },
    {
      name      = "Terry Chan"
      email     = "terry_chan@example.com"
      role      = "limited_user"
      team      = pagerduty_team.networking.id
      team_role = "manager"
    },

    # Security
    {
      name      = "Thomas Burton"
      email     = "thomas_burton@example.com"
      role      = "limited_user"
      team      = pagerduty_team.security.id
      team_role = "responder"
    },
    {
      name      = "Grayson Williams"
      email     = "grayson_williams@example.com"
      role      = "limited_user"
      team      = pagerduty_team.security.id
      team_role = "responder"
    },
    {
      name      = "Danny Thompson"
      email     = "danny_thompson@example.com"
      role      = "admin"
      team      = pagerduty_team.security.id
      team_role = null
    },

    # Major Incident Management
    {
      name      = "Alex Contreras"
      email     = "alex_contreras@example.com"
      role      = "admin"
      team      = pagerduty_team.major_incident_management.id
      team_role = null
    },
    {
      name      = "Rhian Roy"
      email     = "rhian_roy@example.com"
      role      = "admin"
      team      = pagerduty_team.major_incident_management.id
      team_role = null
    },
    {
      name      = "David Seaborne"
      email     = "david_seaborne@example.com"
      role      = "admin"
      team      = pagerduty_team.major_incident_management.id
      team_role = null
    }

  ]
}


/* 
  User Objects
*/
resource "pagerduty_user" "users" {
  count     = length(local.users)
  name      = local.users[count.index].name
  email     = local.users[count.index].email
  role      = local.users[count.index].role
}

/* 
  User Team Membership
*/
resource "pagerduty_team_membership" "team_memberships" {
  count   = length(local.users)
  user_id = pagerduty_user.users[count.index].id
  team_id = local.users[count.index].team
  role    = local.users[count.index].team_role != null ? local.users[count.index].team_role : "manager"
}
