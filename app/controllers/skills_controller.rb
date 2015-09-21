class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]


  def index
    @skills = Skill.all.latest_first
  end


  def show
    @tags=@skill.tags.map {|x| x.name}
  end

  def new
    @skill = Skill.new
  end


  def edit
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.js { render :create_success }
      else
        format.html { render :new }
        format.js { render :create_failure }
      end
    end
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit([{tag_ids: []}])
    end
end
