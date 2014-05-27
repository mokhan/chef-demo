# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default['application'] = 'example'
default['username'] = 'rails'

default['root_path'] = '/home/rails/apps/example'
default['current_path'] = '/home/rails/apps/example/current'
default['shared_path'] = '/home/rails/apps/example/shared'

default["nginx"]['domain'] = 'www.example.com'
default["nginx"]['ssl_certificate'] = '/etc/nginx/ssl/example.crt'
default["nginx"]['ssl_certificate_key'] = '/etc/nginx/ssl/example.key'

default["postgres"]["database"] = "example"
default["postgres"]["host"] = "localhost"
default["postgres"]["user"] = "rails"
default["postgres"]["password"] = "password"

default['ssh']['keys'] = [
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaWk0N9yIfl5A1zRZrAMj4jXQ49EylhuFw4Q4RYYxsq9ek0C2rA9GrJacy5TxkLXzwR3DM5xs1GIg0dRSsf71zYjDYQ5excTuWU+r0unJtRYPW38Ok6m80C9oaitKvyY7WcjtUPNmeKhuRz88MQTOCKtAm+asyZiCBC0FVc8KH1i2ojXoNmimfIiShEijvYV0GUWUOS3mb1+3GBlbley53fL2vWMEoV3706zdBJmqXL7aGvygk7gBoyHHtQfqJcQjTFUFW7M+awXOY3admXHpDnOsIVM8ft8t+SqogHc+juVzD7c9xCfj4vZSzEDB9hIP1QbIngEu60aqCLHNy0QMl email@mokhan.ca',
]
# For further information, see the Chef documentation (http://docs.opscode.com/essentials_cookbook_attribute_files.html).
