class ProjectService

  def initialize
  end


  def list
  	Project.recent.with_categories
  end
	
end