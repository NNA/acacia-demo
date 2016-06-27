class ProjectsController < ApplicationController
  def index
    Project.order(:name)
  end
end