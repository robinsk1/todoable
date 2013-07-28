class VotesController < ApplicationController

  before_filter :get_obj

  def for
    respond_to do |format|
      if current_user.vote_exclusively_for(@obj)
        @for =  @obj.votes_for
        @against = @obj.votes_against
       format.js {}
      else
      @for =  @obj.votes_for
      @against = @obj.votes_against
       format.js { render :json => @result, notice: 'Something went wrong!' }
      end
    end
  end

  def against
    respond_to do |format|
      if current_user.vote_exclusively_against(@obj)
        @for =  @obj.votes_for
        @against = @obj.votes_against
       format.js {}
      else
       @for =  @obj.votes_for
       @against = @obj.votes_against
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
