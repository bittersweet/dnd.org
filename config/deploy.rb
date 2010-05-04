require 'capistrano/ext/multistage'

set :default_stage, "production"
set :stages, %w(production staging)

# default_run_options[:pty] = true
set :application, 'denachtdienst.org'
set :rails_env,   'production'
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

  after "deploy:update_code",
        "deploy:link_configs",
        "deploy:link_artists",
        "deploy:link_audio",
        "deploy:link_app_config",
        "deploy:precache_assets"

  desc "Link to configs in shared/config"
  task :link_configs do
    ['database.yml', 'newrelic.yml'].each do |file|
      run "ln -nfs #{deploy_to}/#{shared_dir}/config/#{file} #{release_path}/config/#{file}"
    end
  end

  desc "Link artists"
  task :link_artists do
    run "ln -nfs #{deploy_to}/shared/artists #{release_path}/public/artists"
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

namespace :delayed_job do
  desc "Start delayed_job process"
  task :start, :roles => :app do
    run "cd #{current_path}; script/delayed_job start #{rails_env}"
  end

  desc "Stop delayed_job process"
  task :stop, :roles => :app do
    run "cd #{current_path}; script/delayed_job stop #{rails_env}"
  end

  desc "Restart delayed_job process"
  task :restart, :roles => :app do
    run "cd #{current_path}; script/delayed_job restart #{rails_env}"
  end
end

after "deploy:start", "delayed_job:start"
after "deploy:stop", "delayed_job:stop"
after "deploy:restart", "delayed_job:restart"
