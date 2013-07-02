#require 'puma/capistrano'
require "capistrano-rbenv"
set :rbenv_ruby_version, "2.0.0-p195"
set :rbenv_path, "/opt/rbenv"

require 'bundler/capistrano'

server '166.78.106.233' , :web, :app, :db, primary: true
set :application, "my_app"
set :scm, 'git'
set :repository, 'git@github.com:hayesmp/todo.git'
set :branch, 'master'
set :user, 'root'
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
#after 'deploy', 'puma:start'
after 'deploy:restart', 'deploy:cleanup'

namespace :deploy do
  task :setup_config, roles: :app do
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end