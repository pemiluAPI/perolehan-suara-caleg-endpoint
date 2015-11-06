server "54.255.145.91", roles: [:app, :web, :db]

set :ssh_options, {
  user: "ubuntu",
  forward_agent: true,
  keys: ["~/.ssh/pemiluapi.pem"]
}

set :stage, :staging

set :deploy_to, "/home/ubuntu/htdocs/#{fetch(:application)}"
set :deploy_via, :remote_cache

set :use_sudo, false
set :keep_releases, 2

set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p247'

def remote_file_exists?(full_path)
  'true' == capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

namespace :deploy do
  task :restart do
    on roles(:all) do
      execute "touch #{current_path}/tmp/restart.txt"
    end
  end

  task :symlink_config_files do
    on roles(:all) do
      execute "ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    end
  end
end

before "deploy:finished", "deploy:restart"
