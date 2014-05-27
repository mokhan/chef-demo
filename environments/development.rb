name "development"
description "development environment"

override_attributes(
  "nginx" => {
    'domain' => '_'
  },
  "authorization" => {
    "sudo" => {
      "users" => ["rails", "vagrant"],
      "passwordless" => "true"
    }
  }
)
