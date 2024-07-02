resource "random_password" "this_password" {
  length = 11
  lower  = true
  upper  = true
  #number            = (0-9)
  special   = true
  min_lower = 1
  min_upper = 1
  #min_number        = 1
  min_special      = 1
  override_special = "!#$%&"
}