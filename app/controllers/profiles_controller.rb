class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

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
    @profile = Profile.find_by(directory: params[:directory])

    if @profile.nil?
      render "errors/not_found", status: :not_found, layout: false
      return
    end

    @user = @profile.user
    @links = @user.links.order(:position)
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar_url, :color_theme, :theme, social_links: [])
  end

end
