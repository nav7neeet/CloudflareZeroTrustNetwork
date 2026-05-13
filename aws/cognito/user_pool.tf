resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.unique_id}_user_pool"

  ## avoid anonymous user signups!
  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  auto_verified_attributes = ["email"]
  verification_message_template {
    default_email_option = "CONFIRM_WITH_LINK"
  }

  password_policy {
    minimum_length                   = 10
    require_numbers                  = true
    require_lowercase                = false
    require_uppercase                = false
    require_symbols                  = false
    temporary_password_validity_days = 7
  }

  schema {
    name                = "email"
    attribute_data_type = "String"
    required            = true
    mutable             = true

    string_attribute_constraints {
      min_length = 0
      max_length = 50
    }
  }
}

resource "aws_cognito_user" "users" {
  for_each = var.users

  user_pool_id             = aws_cognito_user_pool.user_pool.id
  username                 = each.value.email
  password                 = random_password.user_password.result
  desired_delivery_mediums = ["EMAIL"]
  message_action           = "SUPPRESS"

  attributes = {
    given_name  = each.value.firstname
    family_name = each.value.lastname
    email       = each.value.email
  }
}

resource "aws_cognito_user_group" "groups" {
  for_each = var.users

  name         = each.value.group.name
  description  = each.value.group.description
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user_in_group" "user_group" {
  for_each = var.users

  depends_on = [
    aws_cognito_user.users,
    aws_cognito_user_group.groups
  ]

  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = each.value.email
  group_name   = each.value.group.name
}
