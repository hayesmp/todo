#require 'puma/capistrano'
require "capistrano-rbenv"
set :rbenv_ruby_version, "2.0.0-p195"
set :rbenv_path, "/opt/rbenv"

require 'bundler/capistrano'

server '166.78.106.233' , :web, :app, :db, primary: true
set :application, "my_app"
set :scm, 'git'
set :repository, 'git@github.com:engineyard/todo.git'
set :branch, 'master'
set :user, 'root'
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
#after 'deploy', 'puma:start'
after 'deploy:restart', 'deploy:cleanup'
