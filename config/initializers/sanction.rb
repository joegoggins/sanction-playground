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
  #
  sanction_ui_roles = [
    :can_view_sui_index,
    :can_view_sui_roles_index,
    :can_add_role,
    :can_remove_role,
    :can_describe_role
  ]    
    
  config.role :super_user, User => :global, :having => sanction_ui_roles, :purpose => "to manage all the top level functionality of the application."
  config.role :reader, User => Magazine, :having => [:can_read], :purpose => "to limit who can read which Magazines in the application."
  config.role :editor, User => [Magazine,User], :having => [:can_edit],  :includes => [:reader], :purpose => "to control who can perform editting actions on Magazines and Users profile information"
  config.role :writer, User => Magazine, :having => [:can_write], :includes => [:reader], :purpose => "to allow Users to write Magazine articles."
  config.role :owner,  User => Magazine, :includes => [:editor, :writer], :purpose => "to assign responsibility of ownership to each magazine."
  config.role :boss,   User => [Magazine,User]
  config.role :download_statistics, V1::ApiUser => [Magazine, User], :purpose => "to allow version 1 API users to download stats for Magazines and Users"
  config.role :smoke_crack, [V1::ApiUser, WeirdoUser] => :global
end
