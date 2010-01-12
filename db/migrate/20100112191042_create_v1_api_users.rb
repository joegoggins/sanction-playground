class CreateV1ApiUsers < ActiveRecord::Migration
  def self.up
    create_table :v1_api_users do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :v1_api_users
  end
end
