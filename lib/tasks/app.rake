namespace :app do
  desc "Bomb and rebuild all dbs mentioned in .yml file (assumes local MySQL root user connect with socket), WARNING, fixtures not loaded to _test db yet, just dev"
  #task :setup => ["environment", "app:drop_all", "db:create:all", "db:migrate", "db:fixtures:load", "db:test:clone"]
  task :setup => :environment do
    puts `rake app:drop_all`
    puts `rake db:create:all`
    puts `rake db:migrate`
    puts `rake db:fixtures:load`
    puts `rake db:test:clone`
  end
  desc "drop all dbs reffed in database.yml without being stupid (and throwing an error)"
  task :drop_all => :environment do
    f=YAML.load File.open('config/database.yml')
    f.each_pair do |env,info|
      begin
        ActiveRecord::Base.connection.execute "DROP DATABASE IF EXISTS #{info['database']}"
      rescue Mysql::Error
        # Not sure why this error is thown
        #Mysql::Error: Unknown database 'sanction_playground_development'
      end
    end
  end
end
