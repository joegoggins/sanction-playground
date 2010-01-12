# sanction_ui controllers inherit from this controller
# You can override functionality in SanctionUi::TopLevelController
# and protect actions in child controllers via before or around filters
# look in the plugin to get a feel for what can be overridden
#
# Inheritance Hierachy:
# ApplicationController (Rails)
#   SanctionUi::TopLevelController (Plugin)
#     SanctionUi::AssetController (Plugin)
#     SanctionUi::AuthController (App)
#       SanctionUi::MainController (Plugin)
#       SanctionUi::RolesController (Plugin)

class SanctionUi::AuthController < SanctionUi::TopLevelController
  layout 'sanction_ui'
end