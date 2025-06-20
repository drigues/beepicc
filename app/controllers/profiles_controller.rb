class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to dashboard_path, notice: 'Profile updated.'
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar_url, :color_theme, social_links: [])
  end
end
