class Admin::OverviewController < ApplicationController
  layout "admin"

  def index
    @statistics = Statistic.ordered.latest.includes(:track)
  end
end
