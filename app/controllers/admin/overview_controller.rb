class Admin::OverviewController < ApplicationController
  before_filter :authenticate_user!
end
