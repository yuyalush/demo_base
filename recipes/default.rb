#
# Cookbook Name:: demo_base
# Recipe:: default
#
# Copyright 2013, Yuya "pakue" Yoshida
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get update & upgrade" do
  command "apt-get update && apt-get upgrade -y"
  ignore_failure true
end

%w[zsh git build-essential zlib1g-dev libssl-dev libreadline-dev libxml2-dev libxslt-dev libsqlite3-dev g++ sqlite3].each do |pkg|
  package pkg do
    action :install
  end
end

script "install_ruby" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
  tar -zxf ruby-2.0.0-p0.tar.gz
  cd ruby-2.0.0-p0
  ./configure
  make -j
  make install
  EOH
end

script "install_rails" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  echo "install: --no-ri --no-rdoc" > ~/.gemrc
  echo "update: --no-ri --no-rdoc" > ~/.gemrc
  gem i bundle
  bundle init
  echo 'gem "rails"' >> Gemfile
  bundle install
  EOH
end

script "create_testapp_1" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  rails new testapp --skip-bundle
  EOH
end

cookbook_file "/tmp/testapp/Gemfile" do
  source "Gemfile"
end

script "create_testapp_2" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  cd testapp
  bundle install
  rails g scaffold Book title:string price:integer
  rake db:migrate
  bundle exec unicorn_rails -D
  ufw allow 8080
  EOH
end
