require 'yaml'
require "rvm/capistrano"
require "bundler/capistrano"
secrets = YAML.load_file( "#{ File.dirname(__FILE__)}/secret.yml")

set(:user) { secrets['deployment']['user'] }
set(:password) { secrets['deployment']['password'] }
set :application, "chrisbim2ree"
set :app_path, "/home/#{user}/Rails/#{application}"

set :scm, "git"
set :branch, "master"
set :repository,  "git@github.com:bigos/chrisbim2ree.git"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

set :deploy_to, "#{app_path}"
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "188.226.167.41"                                # Your HTTP server, Apache/etc
role :app, "188.226.167.41"                                # This may be the same as your `Web` server
role :db,  "188.226.167.41", :primary => true              # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "chmod +x #{app_path}/shared/config/unicorn_init.sh"
      run "sh #{app_path}/current/config/unicorn_init.sh #{command}"
    end
  end

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


namespace :deploy do
  desc "Deploy your application"
  task :default do
    update
    restart
  end
  task :finalize_update, :except => {:no_release => true} do
    run "chmod -R g+w #{latest_release}" if fetch(:group_writable, true)

    # mkdir -p is making sure that the directories are there for some SCM's that don't
    # save empty folders
    run <<-CMD
      rm -rf #{latest_release}/log #{latest_release}/public/system #{latest_release}/tmp/pids &&
      mkdir -p #{latest_release}/public &&
      mkdir -p #{latest_release}/tmp &&
      ln -s #{shared_path}/log #{latest_release}/log &&
      ln -s #{shared_path}/system #{latest_release}/public/system &&
      ln -s #{shared_path}/ckeditor_assets #{latest_release}/public/ckeditor_assets &&
      ln -s #{shared_path}/pids #{latest_release}/tmp/pids &&
      ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml
    CMD
  end
end
