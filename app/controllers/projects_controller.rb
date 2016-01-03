class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "backend"

  respond_to :html

  def index
    @projects = current_user.projects.all
    respond_with(@projects)
  end

  def show
    respond_with(@project)
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
