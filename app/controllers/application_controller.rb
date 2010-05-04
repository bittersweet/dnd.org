class ApplicationController < ActionController::Base
  helper :all
  filter_parameter_logging :password, :password_confirmation
  protect_from_forgery
  before_filter :prepare_for_mobile

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end

  private

  helper_method :mobile_device?
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  def prepare_for_mobile
    request.format = :mobile if mobile_device?
  end
end

