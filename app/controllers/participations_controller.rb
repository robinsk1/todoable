class ParticipationsController < ApplicationController

  def create
     participation = current_user.participations.build(:project_id => params[:id])
        respond_to do |format|
          if participation.save
            format.json { render :nothing => true }
          else
            format.json { render json: participation.errors, status: :unprocessable_entity }
          end
        end
   end


   def destroy
     participation = current_user.participations.find_by_project_id(params[:id])
     participation.destroy
        respond_to do |format|
          format.json { render :nothing => true }
        end
     end

end
