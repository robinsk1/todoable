class VotesController < ApplicationController

  before_filter :get_obj

  def for
    respond_to do |format|
      if current_user.vote_exclusively_for(@obj)
      @result =  @obj.votes_for
       format.js {}
      else
      @result =  @obj.votes_for
       format.js { render :json => @result, notice: 'Something went wrong!' }
      end
    end
  end

  def against
    respond_to do |format|
      if current_user.vote_exclusively_against(@obj)
      @result =  @obj.votes_against
       format.js {}
      else
      @result =  @obj.votes_against
       format.js { render :json => @result, notice: 'Something went wrong!' }
      end
    end
  end


  private

  def get_obj
     @obj = params[:model_class].capitalize
     @obj = @obj.constantize.find(params[:id])
  end

end
