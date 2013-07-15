module ProjectsHelper

  def current_user_project_owner?
    current_user == @project.user
  end

  def current_user_todo_author?(todo)
    todo.author == current_user
  end

  def participates_in_list?
    if signed_in? && !current_user_project_owner?
      if current_user.participations.find_by_project_id(@project).nil?
        link_to raw("<span data-icon = 'N' class='big-icons'></span"), join_project_path(@project), :alt=>"join", :id=> "participation", :method=> :put, :remote => false, :data=>{:status=>"join", :project => @project.id}
      else
        link_to raw("<span data-icon = 'O' class='big-icons'></span>"), leave_project_path(@project), :alt=>"leave", :id=> "participation", :method=> :put, :remote => false, :data=>{:status=>"leave", :project=> @project.id}
      end
     end
  end

end
