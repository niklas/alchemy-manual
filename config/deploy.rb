require 'bundler/capistrano'
require 'alchemy/capistrano'
load 'deploy/assets'

# ssh settings
set(:user)                      { Capistrano::CLI.ui.ask('Enter your ssh username: ') }
set(:password)                  { Capistrano::CLI.password_prompt("Enter the password for #{user}: ") }
set(:port)                      { Capistrano::CLI.ui.ask('Enter the ssh port: ') }

# domain names
role :app,                      "alchemy-cms.com"
role :web,                      "alchemy-cms.com"
role :db,                       "alchemy-cms.com", :primary => true

# the webserver path
set :deploy_to,                 "/var/www/web28/html/alchemy-manual"

# repository settings
set :scm,                       "git"
set :repository,                "git://github.com/magiclabs/alchemy-manual.git"
set :branch,                    "master"

# before hooks
before "deploy:start",          "deploy:seed"
before "deploy:create_symlink", "deploy:migrate"

# after hooks
after "deploy:setup",           "alchemy:database_yml:create"
after "deploy:assets:symlink",  "alchemy:database_yml:symlink"
after "deploy",                 "deploy:cleanup"

# special tasks

namespace :logs do
  desc "show last 100 lines of log"
  task :tail do
    run "tail -n100 #{shared_path}/log/#{rails_env}.log"
  end

  desc "watch tail of log and wait for additional data to be appended to the input"
  task :watch do
    stream("tail -f #{shared_path}/log/#{rails_env}.log")
  end
end

namespace :deploy do

  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc 'Seeds the database'
  task :seed, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end

end

## defaults

# rails env
set :rails_env,                 "production"

# enable bundler binstubs
set :bundle_flags,              "--deployment --binstubs"

# do not use sudo
set :use_sudo,                  false
