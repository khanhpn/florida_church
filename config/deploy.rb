# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "florida_church"
set :repo_url, "git@github.com:khanhpn/florida_church.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/html/florida_church"

# Default value for :format is :airbrussh.
# set :format, :airbrussh
set :scm, :git
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
set :log_level, :debug
# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '3.0.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rails gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/storage.yml', 'config/webpacker.yml', 'config/cable.yml', 'config/master.key')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }
set :passenger_restart_with_touch, true

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  after :finishing, 'deploy:restart_passenger'
end
