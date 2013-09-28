class ParticipationsController < ApplicationController

  def create
     common
     participation = current_user.participations.build(:project_id => params[:id])
      respond_to do |format|
        if participation.save
          format.js {}
        else
          format.json { render json: participation.errors, status: :unprocessable_entity }
        end
      end
   end


   def destroy
     common
     participation = current_user.participations.find_by_project_id(params[:id])
     participation.destroy
      respond_to do |format|
        format.js{}
      end
   end

  private

  def common
      @project = Project.find(params[:id])
      @closed = Project.find(@project).todos.joins(:completes).where("completes.user_id" => current_user)
      @open = Project.find(@project).todos
      group_ids = @closed.map(&:id)
      @open = Project.find(@project).todos.where(['id not in (?)', group_ids]) unless group_ids.empty?
      @open.all
      if current_user
        @todo = @project.todos.build
      end
  end

end
