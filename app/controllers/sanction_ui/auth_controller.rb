# You can override methods defined in SanctionUi::TopLevelController here.
# Via before_filter's you can also augment the behavior of child classes
#
# Inheritance Hierachy:
# ApplicationController (Rails)
#   SanctionUi::TopLevelController (Plugin)
#     SanctionUi::AccessDeniedController (Plugin)
#     SanctionUi::AssetController (Plugin)
#     SanctionUi::AuthController (App)      YOU ARE HERE, feel free to OVERRIDE stuff in TopLevelController
#       SanctionUi::MainController (Plugin)
#       SanctionUi::RolesController (Plugin)
#
class SanctionUi::AuthController < SanctionUi::TopLevelController
  layout 'sanction_ui'
  
  # Override for non-standard protection of an action over a particular Sanction::Role instance/row
  # Following example prevents anyone from removing the uber-super-user from the permission_manager role
  # Practically speaking this is only the :can_remove_role action,
  # all others, we be checked via action_allowed_for_role_definition? instead
  #
  # def action_allowed_for_role?(sanction_permission, role)
  #   if role.principal_type == 'Ps::Person' &&
  #      role.principal_id == '2197841' && 
  #      role.name == 'permission_manager'
  #     return false # you can't remove Joe from this role
  #   end
  #   super
  # end

  # Override actions governing the role definition 
  # where a particular instance of Sanction::Role does not exist aka :can_add_role, :can_describe_role
  # The following example ensures only a current_principal of Joe can add permission_manager's
  #
  # def action_allowed_for_role_definition?(sanction_permission, role_definition)
  #   if current_principal.id == '2197841'
  #     return true
  #   elsif sanction_permission == :can_add_role && role_definition.name == :permission_manager
  #     return false
  #   end
  #   super
  # end
  
  # Use before_filters to load special data for your overriden partials if you need to.
  # Note that you can't just do: @my_special_data = 'bla', you have to operate on the
  # controller instance of the child (which is not SanctionUi::AuthController)
  #
  # before_filter do |controller|
  #   if controller.class == SanctionUi::RolesController &&
  #     controller.action_name == 'index'
  #     controller.instance_eval do
  #       @my_special_data = 'some stuff i render in an overriden partial utilized by roles/index.'
  #     end
  #   end
  # end
end