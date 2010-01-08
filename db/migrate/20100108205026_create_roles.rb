class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.belongs_to :principal, :polymorphic => true
      t.belongs_to :permissionable, :polymorphic => true
      t.string     :name
      t.boolean    :global, :default => false
    end
    
    add_index :roles, [:principal_id, :principal_type]
    add_index :roles, :name
  end

  def self.down
    drop_table :roles
  end
end

