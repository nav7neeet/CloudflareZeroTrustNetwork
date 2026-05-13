plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Enforce a naming convention for variables/outputs/resources
rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

# Require descriptions on variables and outputs
rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

# Disabled to allow variables to be declared ahead of their module usage.
# Variables may be intentionally unused while modules are progressively uncommented.
rule "terraform_unused_declarations" {
  enabled = false
}