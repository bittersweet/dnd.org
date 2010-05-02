class ApplicationController < ActionController::Base
  helper :all
  filter_parameter_logging :password, :password_confirmation
  protect_from_forgery


 layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end

end

