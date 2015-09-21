class WelcomeController < ApplicationController


  def index
    @profiles = Profile.all

    # if params[:search]
    #   @profiles = Profile.search(params[:search]).Profile.order("#{params[:order]}").page(params[:page]).per(per_page)
    # else
    #   @profiles = Profile.order("#{params[:order]}").page(params[:page]).per(per_page)
    # end
  end

  def all_student
    @profiles = Profile.all
  end

  def for_hire
    @profiles = Profile.all.where(for_hire: true)

  end

end
