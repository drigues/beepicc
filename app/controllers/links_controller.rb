class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:edit, :update, :destroy, :track_click]

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to dashboard_path, notice: 'Link added.'
    else
      redirect_to dashboard_path, alert: 'Failed to add link.'
    end
  end

  def update
    if @link.update(link_params)
      redirect_to dashboard_path, notice: 'Link updated.'
    else
      redirect_to dashboard_path, alert: 'Update failed.'
    end
  end

  def destroy
    @link.destroy
    redirect_to dashboard_path, notice: 'Link deleted.'
  end

  def track_click
    @link.increment!(:click_count)
    redirect_to @link.url
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :link_type, :position)
  end
end
