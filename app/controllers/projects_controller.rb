class ProjectsController < ApplicationController
  def index
    @projects = ProjectService.new.list
  end
end