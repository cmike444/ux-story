class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "backend"

  respond_to :html, :js, :json

  def add_persona
    @story = Story.find(params[:story_id])
    @persona = Persona.find(params[:persona_id])
    @story.personas << @persona

    respond_to do |format|
      format.js
    end
  end

   def remove_persona
    @story = Story.find(params[:story_id])
    @persona = Persona.find(params[:persona_id])
    @story.personas.destroy(@persona)

    respond_to do |format|
      format.js
    end
  end

  def index
    @projects = current_user.projects.all
    respond_with(@projects)
  end

  def show
    @story = Story.new
    # respond_with(@project)

    respond_to do |format|
      format.html
      format.csv { 
        send_data @project.to_csv,
        :disposition => "attachment", filename: "#{@project.name.gsub(' ', '_')}.csv" }
      format.xls { 
        send_data @project.to_csv(col_sep: "\t"),
        :disposition => "attachment", filename: "#{@project.name.gsub(' ', '_')}.xls" }
      format.json { 
        send_data @project.stories.to_json,
        :disposition => "attachment", filename: "#{@project.name.gsub(' ', '_')}.json" }
    end
  end

  def new
    @project = current_user.projects.build
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :user_id)
    end
end
