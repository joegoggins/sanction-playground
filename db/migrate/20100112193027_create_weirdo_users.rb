class CreateWeirdoUsers < ActiveRecord::Migration
  def self.up
    create_table :weirdo_users do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :weirdo_users
  end
end
