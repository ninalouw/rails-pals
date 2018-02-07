class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
#   before_action :authorize_access, only: [:show, :edit, :update, :destroy]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
        flash[:success] = 'New profile item created!'
        redirect_to profile_path(@profile)
    else
      flash[:error] = 'Please see errors below'
      render :new
    end
  end

  def show
    # find_gallery method gets called here
  end

  def index
    @profiles = Profile.order(created_at: :desc)
  end

  def edit
    # find_gallery method gets called here
  end

  def update
    # find_gallery method gets called here
    if @profile.update(profile_params)
        flash[:success] = 'Profile item updated!'
        redirect_to profile_path(@profile)
    else
        flash[:error] = 'Please see errors below!'
        render :edit
    end
  end

  def destroy
    # find_gallery method gets called here
    @profile.destroy
    redirect_to profiles_path , notice: 'profile item deleted'
  end

  # Methods created to refactor code
  private
  # find_gallery method, gets called on :show, :edit, :update, :destroy
  def find_profile
    @profile = Profile.find params[:id]
  end

  # gallery_params method used for defining params in create and update
  def profile_params
    params.require(:profile).permit(:screen_name, :description, :occupation,:suburb, :postal_code, :image)
  end

#   def authorize_access
#     unless can? :manage, @gallery
#       redirect_to root_path, alert: 'Access Denied.'
#      end
#   end
end
