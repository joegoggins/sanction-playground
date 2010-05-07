class User < ActiveRecord::Base
  def the_false_check?
    puts "HERE"
    false
  end
  
  def self.n(name)
    self.find(:first,:conditions => ["name = ?",name])
  end
    
end
