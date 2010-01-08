namespace :app do
  desc "Bomb and rebuild all dbs mentioned in .yml file (assumes local MySQL root user connect with socket), WARNING, fixtures not loaded to _test db yet, just dev"
  task :setup => ["db:drop:all", "db:create:all", "db:migrate", "db:fixtures:load", "db:test:clone", "environment"]
end
