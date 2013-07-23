class LikesController < ApplicationController

  #skip_before_filter :verify_authenticity_token, :only => [:create, :destroy]

  def create
     obj = get_obj
     @like = obj.likes.build(:user_id => current_user.id)
     respond_to do |format|
      if @like.save
          format.json { render :nothing => true }
        else
          format.json { render json: @like.errors }
        end
      end
  end


  def destroy
    obj = get_obj
    @like = obj.likes.where(:user_id => current_user.id).first
    @like.destroy
    respond_to do |format|
      format.json { render :nothing => true }
    end
  end



private

def get_obj
   klass = params[:model_class].capitalize
   klass.constantize.find(params[:id])
end

end

