class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :id => false do |t|
      t.string :id, :limit => 32
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
