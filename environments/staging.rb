name "staging"
description "staging environment"

override_attributes(
  "nginx" => { 
    'domain' => 'staging.example.com' 
  },
  "postgres" => {
    "database" => "example",
    "host" => "localhost",
    "user" => "rails",
    "password" => "secret"
  },
  "authorization" => {
    "sudo" => {
      "users" => ["rails", "ubuntu"],
      "passwordless" => "true"
    }
  }
)
cookbook_versions({
  "example" => "1.0.0"
})
