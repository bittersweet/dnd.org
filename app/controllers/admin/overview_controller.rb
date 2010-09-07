class Admin::OverviewController < ApplicationController
  before_filter :authenticate_user!

  layout "admin"

  def index
    @statistics = Statistic.ordered.latest.includes(:track)
  end
end
