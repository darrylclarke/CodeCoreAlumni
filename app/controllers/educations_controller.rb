class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:show, :index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.user = current_user
    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.js { render :create_success }
      else
        format.html { render :new }
        format.js { render :create_failure }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.js { render :edit_education_success }
      else
        format.html { render :edit }
        format.js { render :edit_education_failure }
      end
    end
  end

    def destroy
      @education.destroy
      respond_to do |format|
        format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
        format.js { render :delete_education }
      end
    end

    private

    def set_education
      @education = Education.find(params[:id])
    end

    def education_params
      params.require(:education).permit(:degree, :institution, :desc, :year)
    end

end
