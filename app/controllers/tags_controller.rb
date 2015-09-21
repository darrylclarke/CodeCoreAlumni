class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to admin_skills_path, notice: 'Skill was successfully created.'
    else
      redirect_to admin_skills_path, alert: 'Skill failed to create'
    end
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    redirect_to admin_skills_path
  end
  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
