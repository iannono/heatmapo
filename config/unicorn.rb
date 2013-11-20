rails_env = ENV['RAILS_ENV'] || 'production'
root = "/home/rails/heatmap"
appname = "heatmap"

user 'rails', 'rails'

working_directory "#{root}"

preload_app true

worker_processes 4
timeout 120 

pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen 8080
