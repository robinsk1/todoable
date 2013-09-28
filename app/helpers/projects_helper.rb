module ProjectsHelper

  def current_user_project_owner?
    current_user == @project.user
  end

  def current_user_todo_author?(todo)
    todo.author == current_user
  end

  def participates_in_list?

  end

end
