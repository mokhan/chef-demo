# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

#packages = [
  #"curl",
  #"git-core",
  #"python-software-properties",
  #"build-essential",
  #"tklib",
  #"zlib1g-dev",
  #"libssl-dev",
  #"libreadline-gplv2-dev",
  #"libxml2",
  #"libxml2-dev",
  #"libxslt1-dev",
  #"gawk",
  #"libreadline6-dev",
  #"libyaml-dev",
  #"libsqlite3-dev",
  #"autoconf", 
  #"libgdbm-dev",
  #"libncurses5-dev",
  #"automake",
  #"libtool",
  #"bison",
  #"pkg-config",
  #"libffi-dev"
#]

#packages.each do |item|
  #package item do
    #action :upgrade
  #end
#end

include_recipe "example::user"
include_recipe "example::nginx"
include_recipe "example::postgres"

# For more information, see the documentation: http://docs.opscode.com/essentials_cookbook_recipes.html
