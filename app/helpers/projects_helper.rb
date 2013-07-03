module ProjectsHelper

  def current_user_project_owner?
    current_user == @project.user
  end

  def participates_in_list?
    if !current_user.participations.find_by_project_id(@project).nil?
      link_to "leave", leave_project_path(@project), :remote => :true,  :method => :put, :id => "participation"
    else
      link_to "join", join_project_path(@project), :remote => :true,  :method => :put, :id => "participation"
    end

  end

end
