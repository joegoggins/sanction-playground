##
# This file contains the principals, permissionables, and roles
# that define this configuration of Sanction.
#
Sanction.configure do |config|
  # Define your principals
  config.principals = [User]

  # Define your permissionables
  config.permissionables = [User, Magazine]

  # Define your roles
  config.role :super_user, User => :global
  config.role :reader, User => Magazine, :having => [:can_read]
  config.role :editor, User => Magazine, :having => [:can_edit],  :includes => [:reader]
  config.role :writer, User => Magazine, :having => [:can_write], :includes => [:reader]
  config.role :owner,  User => Magazine, :includes => [:editor, :writer]
  config.role :boss,   User => [Magazine,User]

end
