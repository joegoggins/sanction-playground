##
# This file contains the principals, permissionables, and roles
# that define this configuration of Sanction.
#
Sanction.configure do |config|
  # Define your principals
  config.principals = [User, V1::ApiUser, WeirdoUser]

  # Define your permissionables
  config.permissionables = [User, Magazine]

  # Define your roles
  # Note: :can_view_roles? is a sanction_ui permission
  #
  sanction_ui_roles = [
    :can_view_sui_index,
    :can_view_sui_roles_index,
    :can_add_role,
    :can_remove_role,
    :can_describe_role
  ]    
    
  config.role :super_user, User => :global, :having => sanction_ui_roles, :about => "a global role that allows Users to manage roles"
  config.role :reader, User => Magazine, :having => [:can_read], :about => "allows Users to read Magazines"
  config.role :editor, User => [Magazine,User], :having => [:can_edit],  :includes => [:reader], :about => "allows Users to edit Magazines and Users and inherits all permissions from the reader role"
  config.role :writer, User => Magazine, :having => [:can_write], :includes => [:reader], :about => "allows Users to write Magazines and inherits all permissions from the reader role"
  config.role :owner,  User => Magazine, :includes => [:editor, :writer], :about => "inherits all permissions from the editor and writer roles"
  config.role :boss,   User => [Magazine,User]
  config.role :download_statistics, V1::ApiUser => [Magazine, User], :about => "allows version 1 API users to download stats for Magazines and Users"


  config.role :smoke_crack, [V1::ApiUser, WeirdoUser] => :global
end
