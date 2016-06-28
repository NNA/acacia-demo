class ProjectService

  def initialize
  end

  def find id
    found_project = Project.find id
    [true, found_project]
  rescue => e
    [false, e.message]
  end

  def list
  	Project.recent.with_categories
  end

  def build_new attributes={}
    Project.new attributes
  end

  def create attributes
    project = build_new(attributes)
    saved = project.save
    [saved, project]
  end
	
end