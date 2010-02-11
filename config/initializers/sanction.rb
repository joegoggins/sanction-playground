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
  #This is the permiossions used to protect the various actiosn associated with sanction_ui
  config.role :permission_manager, 
              User => :global, 
              :having => [:can_add_role,:can_view_permissions,:can_remove_role,:can_describe_role], 
              :purpose => "to manage who can access what in the application"    

  # For playing with :and constraints
  config.role :special_reader, User => Magazine, :having => [:can_read], :and => :the_true_check?
  config.role :special_writer, User => Magazine, :having => [:can_read], :and => [:the_false_check?], :includes => [:special_reader]
  config.role :special_editor, User => Magazine, :having => [:can_read], :includes => [:special_writer]
              
  config.role :super_user, User => :global,
    :includes => [:permission_manager], 
    :purpose => "to manage all the top level functionality of the application."
  config.role :reader, User => Magazine, 
    :having => [:can_read], 
    :purpose => "to limit who can read which Magazines in the application."
  config.role :editor, User => [Magazine,User], 
    :having => [:can_edit],  
    :includes => [:reader], 
    :purpose => "to control who can perform editting actions on Magazines and Users profile information"
  config.role :writer, User => Magazine, :having => [:can_write], :includes => [:reader], :purpose => "to allow Users to write Magazine articles."
  config.role :owner,  User => Magazine, :includes => [:editor, :writer], :purpose => "to assign responsibility of ownership to each magazine."
  config.role :boss,   User => [Magazine,User]
  config.role :download_statistics, V1::ApiUser => [Magazine, User], :purpose => "to allow version 1 API users to download stats for Magazines and Users"
  config.role :smoke_crack, [V1::ApiUser, WeirdoUser] => :global
end
