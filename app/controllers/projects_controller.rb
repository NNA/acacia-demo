class ProjectsController < ApplicationController

  before_action :load_service
  
  def index
    @projects = @svc.list
  end

  def show
    project_found, @project = @svc.find params[:id]
    unless @project
      flash[:error] = 'Ce projet n\'existe pas'
      redirect_to projects_path
    end
  end

  def new
    @project    = @svc.build_new
  end

  def create
    project_created, @project = @svc.create project_params

    if project_created
      redirect_to project_path(@project.id), notice: 'Projet créé avec succès'
    else
      flash[:error] = 'Le projet n\'a pas été créé'
      render :new
    end
  end

private
  
  def load_service
    @svc = ProjectService.new
  end

  def project_params
    params.require(:project).permit(:name, :description, :place, :category_id, :amount)
  end
end