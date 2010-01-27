# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100126230219) do

  create_table "magazines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string  "principal_id",        :limit => 32
    t.string  "principal_type",      :limit => 64
    t.string  "permissionable_id",   :limit => 32
    t.string  "permissionable_type", :limit => 64
    t.string  "name"
    t.boolean "global",                            :default => false
  end

  add_index "roles", ["global"], :name => "index_roles_on_global"
  add_index "roles", ["name"], :name => "index_roles_on_name"
  add_index "roles", ["permissionable_id", "permissionable_type"], :name => "index_roles_on_permissionable_id_and_permissionable_type"
  add_index "roles", ["principal_id", "principal_type"], :name => "index_roles_on_principal_id_and_principal_type"

  create_table "users", :id => false, :force => true do |t|
    t.string   "id",         :limit => 32
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "v1_api_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weirdo_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
