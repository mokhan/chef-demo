username = node['username']
ssh = node['ssh']

user username do
  supports manage_home: true
  comment "Rails User"
  home "/home/#{username}"
  shell "/bin/bash"
end

directory "/home/#{username}/.ssh" do
  owner username
  group username
  mode '0700'
  action :create
end

template "/home/#{username}/.ssh/authorized_keys" do
  owner username
  group username
  source "authorized_keys.erb"
  mode "0644"
  variables(keys: ssh['keys'])
end
