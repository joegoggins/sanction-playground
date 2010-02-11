SanctionUi.configure do |config|
  # See mattr_accessor's in plugin lib/sanction_ui.rb for more details and other overridable options
  #
  # Note: any html view can be overriden by simply copying a file from the plugin to
  # your app, then modifying
  
  # Note: Access control of Sanction UI is done via the global roles
  # defined in the sanction.rb initializer (not here)
  # For fancy super granular access control see controllers/sanction_ui/auth_controller.rb
  
  # Define your "to_s"ish methods for each principal and permssionable classes
  # The example below would be evaulated like @person.name_display(:full)
  config.set_principal_to_s_method(User,"name")
  config.set_principal_to_s_method(V1::ApiUser,"name")
  config.set_principal_to_s_method(WeirdoUser,"name")

  config.set_permissionable_to_s_method(Magazine,"name")
  
  # Set to false if you want your access denied page to
  # say nothing to users about why they were denied access
  # Will use @role_definition.purpose for the string to describe.
  #
  # config.describe_on_deny
  
  # Set stuff that will be shown to users on access denied page in describe_on_deny is true
  #config.denied_contact_label = "The A Web Team"
  #config.denied_contact_email = "the-a-team@umn.edu"
  
  # Set top level url prefix
  #config.route_url_prefix = "/somthing_other_than_permissions"

  # Override label's (grep for sui_label to find where each label is used in the view)
  # config.set_label(:access_denied, "Sorry boi, no dice!")
end
