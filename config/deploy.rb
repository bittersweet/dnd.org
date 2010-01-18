default_run_options[:pty] = true
set :application, 'denachtdienst.org'
set :user,        'deploy'
set :port,        30000
set :repository,   'git@github.com:bittersweet/dnd.org.git'
set :scm,         'git'
set :deploy_to,   "/home/deploy/sites/#{application}"
set :use_sudo, false

ssh_options[:forward_agent] = true
ssh_options[:username] = 'deploy'

role :app, application
role :web, application
role :db, application, :primary => true

namespace :deploy do

  after "deploy:update_code", "deploy:link_production_db", "deploy:link_audio", "deploy:link_app_config"

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

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end
