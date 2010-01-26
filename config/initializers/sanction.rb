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
    
  config.role :super_user, User => :global, :having => sanction_ui_roles
  config.role :reader, User => Magazine, :having => [:can_read]
  config.role :editor, User => [Magazine,User], :having => [:can_edit],  :includes => [:reader]
  config.role :writer, User => Magazine, :having => [:can_write], :includes => [:reader]
  config.role :owner,  User => Magazine, :includes => [:editor, :writer]
  config.role :boss,   User => [Magazine,User]
  config.role :download_statistics, V1::ApiUser => [Magazine, User]


  config.role :smoke_crack, [V1::ApiUser, WeirdoUser] => :global
end
