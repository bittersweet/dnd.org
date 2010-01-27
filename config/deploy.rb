set :default_stage, "production"
set :stages, %w(production staging)
require 'capistrano/ext/multistage'

# default_run_options[:pty] = true
set :application, 'denachtdienst.org'
role :app, application
role :web, application
role :db, application, :primary => true

# Git
set :repository,  'git@github.com:bittersweet/dnd.org.git'
set :scm,         'git'
set :deploy_via, :remote_cache
set :use_sudo,    false

# SSH
set :user,        'deploy'
set :port,        30000
ssh_options[:forward_agent] = true
ssh_options[:username] = 'deploy'

namespace :deploy do

  after "deploy:update_code", "deploy:link_production_db", "deploy:link_audio", "deploy:link_app_config", "deploy:precache_assets"

  desc "Link in the production database.yml"
  task :link_production_db do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Link audio"
  task :link_audio do
    run "ln -nfs #{deploy_to}/shared/audio #{release_path}/public/audio"
  end

  desc "Link the app_config file"
  task :link_app_config do
    run "ln -nfs #{deploy_to}/shared/config/config.yml #{release_path}/config/config.yml"
  end

  desc 'Bundle and minify the JS and CSS files'
  task :precache_assets, :roles => :app do
    root_path = File.expand_path(File.dirname(__FILE__) + '/..')
    assets_path = "#{root_path}/public/assets"
    run_locally "/usr/bin/jammit"
    top.upload assets_path, "#{current_release}/public", :via => :scp, :recursive => true
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end
