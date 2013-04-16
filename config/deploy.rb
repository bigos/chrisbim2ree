set :application, "chrisbim2ree"
set :repository,  "git@github.com:bigos/chrisbim2ree.git" 

set(:user) { Capistrano::CLI.ui.ask("host monster User name: ") }
set :app_path, "/home2/#{user}/rails/chrisbim2ree"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "chrisbeard-images.com"                          # Your HTTP server, Apache/etc
role :app, "chrisbeard-images.com"                          # This may be the same as your `Web` server
role :db,  "chrisbeard-images.com", :primary => true # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
#after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app do
    run " touch #{File.join(app_path,'tmp','restart.txt')}"
    run " ls -l #{File.join(app_path,'tmp','restart.txt')}"
   end
 end

task :list_home, :roles => :app do
  run "ls -1 #{app_path} "
end
