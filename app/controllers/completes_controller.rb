class CompletesController < ApplicationController

  def create
    @completion = current_user.completes.build(:todo_id => params[:id])
    authorize! :create, @completion
       respond_to do |format|
         if @completion.save
           format.js
         else
           format.js { render json: @completion.errors }
         end
       end
  end

  def destroy
    @completion = current_user.completes.find_by_todo_id(params[:id])
    authorize! :destroy, @completion
     respond_to do |format|
      if @completion.destroy
       format.js
      else
        format.js { render json: @completion.errors }
      end
     end
  end

end
