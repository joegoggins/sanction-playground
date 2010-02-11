namespace :app do
  desc "Bomb and rebuild all dbs mentioned in .yml file (assumes local MySQL root user connect with socket), WARNING, fixtures not loaded to _test db yet, just dev"
  #task :setup => ["environment", "app:drop_all", "db:create:all", "db:migrate", "db:fixtures:load", "db:test:clone"]
  task :setup => :environment do
    puts `rake app:drop_all`
    puts `rake db:create:all`
    puts `rake db:migrate`
    puts `rake db:fixtures:load` # loads users and magazines
    puts `rake app:load_permission_fixtures`
    puts `rake db:test:clone`
    puts "Be weary of the weirdness of committing and pushing with two submodules.  (talk to Joe if you begin to hate life because of it.)"
    puts "You should be good to go at localhost:3000 (after firin up a server)"    
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
  
  desc "Load some permissions data"
  task :load_permission_fixtures => :environment do
    Sanction::Role.delete_all
    # joe is a super user
    @joe = User.find_by_name 'joe'
    @joe.grant :super_user
    @joe.grant :permission_manager
    
    # matt is the boss of joe
    @matt = User.find_by_name 'matt'
    @matt.grant(:boss, @joe)
    
    # Matt is a reader of all magazines
    @matt.grant(:reader, Magazine)
  
    # pete is a magazine editor of the wall street journal and the economist
    @wsj = Magazine.find 126485940
    @econ = Magazine.find 792893027
    @pete = User.find_by_name 'pete'
    @pete.grant(:editor, @wsj)
    @pete.grant(:editor, @econ)
    
    
    @api_user1 = V1::ApiUser.find_by_name 'api1'
    # Can get stats for all magazines
    @api_user1.grant(:download_statistics, Magazine)
    
    # Can get stats for Pete
    @api_user1.grant(:download_statistics, @pete)
    
    @weirdo = WeirdoUser.find_by_name 'luis'
    @weirdo.grant(:smoke_crack)
  end
end
