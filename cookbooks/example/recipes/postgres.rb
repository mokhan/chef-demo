include_recipe "postgresql::server"
include_recipe "database::postgresql"

database = node['postgres']["database"]
username = node['postgres']['user']
password = node['postgres']["password"]
host = node['postgres']['host']

postgresql_connection_info = {
  host: host,
  port: 5432,
  username: 'postgres',
  password: node['postgresql']['password']['postgres'],
}

postgresql_database_user username do
  connection postgresql_connection_info
  password password
  action :create
end

postgresql_database database do
  connection postgresql_connection_info
  action :create
end

postgresql_database_user username do
  connection postgresql_connection_info
  database_name database
  privileges [:all]
  action :grant
end

template "#{node['shared_path']}/config/database.yml" do
  source "database.yml.erb"
  mode "0664"
  variables({
    rails_env: node.chef_environment,
    database: database,
    username: username,
    password: password,
    host: host,
  })
end
