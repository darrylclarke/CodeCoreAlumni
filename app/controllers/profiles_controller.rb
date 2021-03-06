class ProfilesController < ApplicationController

  before_action :authorize!, only: [:edit, :update, :destroy]

  before_action :authenticate_user!, except: [:show]

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
        format.html  { redirect_to profile_path(slug: @user.slug), notice: "Profile created!" }
        format.json  { render :show, status: :created, location: @profile }
      else
        format.html { render :new, alert: "Profile failed to create!"  }
        format.json   { render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit

      @user = User.find_by_slug( params[:slug] )
      @profile = @user.profile

    if @profile.user_id != current_user.id
      redirect_to profile_path(@profile)
    end
  end

  def update
    @profile = Profile.find(params[:slug])
    @user = @profile.user
    respond_to do |format|
      if @profile.update profile_params
        format.html { redirect_to profile_path(slug: @user.slug), notice: "Profile updated!" }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :new }
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
    if params[:slug]
      @user = User.find_by_slug( params[:slug] )
      @profile = @user.profile
    else
      @profile = Profile.find( params[:id] )
      @user    = @profile.user
    end
  end

  def index
    @profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:title, :description_long, :description_short, :linkedin,
                                    :github, :twitter, :personal_url, :avatar, :resume,
                                    :for_hire, {tag_ids: []})
  end

  def authorize!
    redirect_to root_path, alert: "Access Denied. Are you the owner of this experience?" unless current_user
  end
end
