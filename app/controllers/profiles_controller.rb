class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.find(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html{ redirect_to profiles_path(@profile), notice: "Profile created!" }
        format.json  { render :show, status: :created, location: @profile }
      else
        format.html { :new }
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
      if @profile.update
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
  end

  def index
    @profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:description_long, :description_short, :linkedin, :facebook, :twitter, :personal_url)
  end
end
