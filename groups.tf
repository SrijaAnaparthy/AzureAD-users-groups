resource "azuread_group" "Engineer" {
  display_name = "Devops Team"
  security_enabled = true
}

resource "azuread_group_member" "devops" {
  for_each = { for u in azuread_user.users: u.display_name => u if u.job_title == "Engineer" }

  group_object_id  = azuread_group.Engineer.id
  member_object_id = each.value.id
}

resource "azuread_group" "managers" {
  display_name = "Tech Lead - Managers"
  security_enabled = true
}

resource "azuread_group_member" "managers" {
  for_each = { for u in azuread_user.users: u.display_name => u if u.job_title == "Manager" }

  group_object_id  = azuread_group.managers.id
  member_object_id = each.value.id
}

resource "azuread_group" "Developers" {
  display_name = "Developer Team"
  security_enabled = true
}

resource "azuread_group_member" "developer" {
  for_each = { for u in azuread_user.users: u.display_name => u if u.department == "Full-Stack-Developement" }

  group_object_id  = azuread_group.Developers.id
  member_object_id = each.value.id
}
