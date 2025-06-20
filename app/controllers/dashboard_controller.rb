class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @profile = current_user.profile
    @links = current_user.links.order(:position)
  end
end
