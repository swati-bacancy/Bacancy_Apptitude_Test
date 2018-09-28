# config valid only for current version of Capistrano
lock "3.11.0"

server '139.59.7.98', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:swati-bacancy/Bacancy_Apptitude_Test.git'
set :application,     'Bacancy_Apptitude_Test'
set :user,            'ubuntu'

set :rvm_bin_path, "$HOME/bin"
# set :rvm_ruby_version, '2.2.2@nuvo'

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :rails_env,       "production"
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }

set :branch,        :master

namespace :deploy do

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart'
      invoke 'deploy'
    end
  end

  set :linked_files, %w{app/model/password.rb app/views/home/technical.html.erb}
  # after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
