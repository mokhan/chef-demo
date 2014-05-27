name "base"
description "base server role"
run_list "recipe[apt]", "recipe[ntp]", "recipe[sudo]", "recipe[chef-client::delete_validation]", "recipe[chef-client]", "recipe[openssh]"

default_attributes(
  'ntp' => {
    'servers' => ['0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org']
  },
  "authorization" => {
    "sudo" => {
      "users" => ["rails"],
      "passwordless" => "true"
    }
  },
  "openssh" => {
    "server" => {
      "password_authentication" => "no"
    }
  }
)
