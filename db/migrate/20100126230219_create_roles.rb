class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string     :principal_id, :limit => 32
      t.string     :principal_type, :limit => 64
      t.string     :permissionable_id, :limit => 32
      t.string     :permissionable_type, :limit => 64
      t.string     :name
      t.boolean    :global, :default => false
    end
    
    add_index :roles, [:principal_id, :principal_type]
    add_index :roles, [:permissionable_id, :permissionable_type]
    add_index :roles, :name
    add_index :roles, :global
  end

  def self.down
    drop_table :roles
  end
end

