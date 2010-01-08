namespace :app do
  desc 'run this everytime you start workin on this app'
  task :setup => ["db:create:all"]

  desc "Set things up and run tests for the first time (assumes local MySQL root user connect with socket), WARNING, fixtures not loaded to _test db yet, just dev"
  task :init => ["app:destroy", "app:setup", "db:migrate", "db:fixtures:load", "db:test:clone", "environment"]

  desc "kill all local dbs"
  task :destroy => ["db:drop:all"]  
end
