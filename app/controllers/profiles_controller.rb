class ProfilesController < ApplicationController


  before_action :authorize!, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @user = current_user
    @profile = Profile.new
    @project = Project.new
    @education = Education.new
    @experience = Experience.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @user = @profile.user
    respond_to do |format|
      if @profile.save
        format.html  { redirect_to @profile, notice: "Profile created!" }
        format.json  { render :show, status: :created, location: @profile }
      else
        format.html { render :new, alert: "Profile failed to create!"  }
        format.json   { render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update profile_params
        format.html { redirect_to profile_path(@profile), notice: "Profile updated!" }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile destroyed!' }
      format.json { head :no_content }
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def index
    @profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:description_long, :description_short, :linkedin,
                                    :github, :twitter, :personal_url, :avatar, :resume,
                                    :for_hire)
  end

  def authorize!
    redirect_to root_path, alert: "Access Denied. Are you the owner of this experience?" unless current_user
  end
end
