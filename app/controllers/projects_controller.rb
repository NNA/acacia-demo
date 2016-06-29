class ProjectsController < ApplicationController

  before_action :load_service
  before_action :set_gmaps_key, only: [:show, :new, :edit]
  
  def index
    @projects = @svc.list
  end

  def show
    find_or_return_to_index params[:id]
  end

  def new
    @project    = @svc.build_new
  end

  def create
    project_created, @project = @svc.create project_params

    if project_created
      redirect_to project_path(@project.id), notice: 'Projet créé avec succès'
    else
      flash.now[:alert] = 'Le projet n\'a pas été créé'
      render :new
    end
  end

  def edit
    find_or_return_to_index params[:id]
  end

  def update
    find_or_return_to_index params[:id]
    project_updated, @project = @svc.update params[:id], project_params

    if project_updated
      redirect_to project_path(@project.id), notice: 'Projet mis à jour avec succès'
    else
      flash.now[:alert] = 'Le projet n\'a pas été mis à jour'
      render :edit
    end
  end  

private

  def find_or_return_to_index project_id
    project_found, @project = @svc.find project_id
    unless project_found
      flash[:alert] = 'Ce projet n\'existe pas'
      redirect_to projects_path
    end
  end

  def set_gmaps_key
    @gmaps_key = GMAPS_KEY;
  end
  
  def load_service
    @svc = ProjectService.new
  end

  def project_params
    params.require(:project).permit(:name, :description, :location, :latitude, :longitude, :category_id, :amount)
  end
end