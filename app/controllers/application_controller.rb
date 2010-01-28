# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  # This would be where you would define a real method that would yield
  # an object that would return
  # 
  def current_principal
    @current_principal ||= User.find_by_name 'joe'
  end
  helper_method :current_principal
end
