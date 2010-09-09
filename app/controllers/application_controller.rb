class ApplicationController < ActionController::Base
  self.responder = AppResponder
  respond_to :html

  helper :all
  protect_from_forgery
  before_filter :prepare_for_mobile
  before_filter :track_location

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end

  def set_sub_tab
    @subtab = true
  end

  private

  helper_method :mobile_device?
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  def prepare_for_mobile
    request.format = :mobile if mobile_device?
  end

  def track_location
    RestClient.get('http://localhost:8000/activity', {
      :location => request.path_info
    })
  end
end

