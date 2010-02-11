class User < ActiveRecord::Base
  def the_false_check?
    puts "HERE"
    false
  end
end
