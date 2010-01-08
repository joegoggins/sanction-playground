##
# This file contains the principals, permissionables, and roles
# that define this configuration of Sanction.
#
Sanction.configure do |config|
  # Define your principals
  # config.principals = [Person]

  # Define your permissionables
  # config.permissionables = [Person, Magazine]

  # Define your roles
  # config.role :reader, Person => Magazine, :having => [:can_read]
  # config.role :editor, Person => Magazine, :having => [:can_edit],  :includes => [:reader]
  # config.role :writer, Person => Magazine, :having => [:can_write], :includes => [:reader]
  # config.role :owner,  Person => Magazine, :includes => [:editor, :writer]
  # config.role :boss,   Person => Person
end
