class CompletesController < ApplicationController

  def create
    @completion = current_user.completes.build(:todo_id => params[:id])
       respond_to do |format|
         if @completion.save
           format.json { render :nothing => true }
         else
           format.json { render json: @completion.errors, status: :unprocessable_entity }
         end
       end

  end

  def destroy
    @completion = current_user.completes.find_by_todo_id(params[:id])
    @completion.destroy
     respond_to do |format|
       format.json { render :nothing => true }
     end
  end

end
