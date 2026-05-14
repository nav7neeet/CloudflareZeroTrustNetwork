resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}

resource "random_password" "user_password" {
  length  = 16
  upper   = true
  lower   = true
  numeric = true
  special = true

  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = "!#$%~`^&*()<>.|"
}
