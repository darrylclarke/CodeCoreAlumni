class WelcomeController < ApplicationController


  def index
    @profiles = Profile.all
    # if params[:search]
    #   @profiles = Profile.search(params[:search]).Profile.order("#{params[:order]}").page(params[:page]).per(per_page)
    # else
    #   @profiles = Profile.order("#{params[:order]}").page(params[:page]).per(per_page)
    # end
  end

  def show
  end
  def all_student

  end

  def for_hire

  end

end
