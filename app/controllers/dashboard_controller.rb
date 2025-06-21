class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    @links = current_user.links.order(:position)
  end

  def show
    if current_user.respond_to?(:profile)
      @profile = current_user.profile
      @links = current_user.links.order(:position)
    else
      Rails.logger.error "⚠️ current_user is not a User: #{current_user.inspect}"
      redirect_to root_path, alert: "Unexpected user session."
    end
  end
end