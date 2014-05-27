name "webserver"
description "web server"
run_list "role[base]", "recipe[example]"

override_attributes({
  "postgresql" => {
    "version" => "9.3"
  }
})
