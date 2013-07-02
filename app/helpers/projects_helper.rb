module ProjectsHelper

  def current_user_project_owner?
    current_user == @project.user
  end

end
