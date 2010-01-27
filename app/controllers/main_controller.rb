class MainController < ApplicationController
  def index
    if current_user.has? :editor
      render :text => 'asdf'
    else
      redirect_to sanction_ui_access_denied_path(:editor) and return
      render :text => 'xxx'
    end
  end

end
