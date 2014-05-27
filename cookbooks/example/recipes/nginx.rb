apt_repository "nginx-stable" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end

package "nginx" do
  action :install
end

directory "/etc/nginx/ssl" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

cookbook_file "/etc/nginx/ssl/example.crt" do
  source "#{node.chef_environment}.crt"
  mode "0644"
end

cookbook_file "/etc/nginx/ssl/example.key" do
  source "#{node.chef_environment}.key"
  mode "0644"
end

nginx = node["nginx"]
template "/etc/nginx/sites-available/example" do
  source "nginx_unicorn.erb"
  mode "0644"
  variables({
    domain: nginx['domain'],
    current_path: node['current_path'],
    shared_path: node['shared_path'],
    ssl_certificate: nginx['ssl_certificate'],
    ssl_certificate_key: nginx['ssl_certificate_key'],
    application: node['application']
  })
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/example" do
  to "/etc/nginx/sites-available/example"
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

service "nginx" do
  action [:enable, :start]
end
