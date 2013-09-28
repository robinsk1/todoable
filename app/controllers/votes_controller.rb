class VotesController < ApplicationController

  before_filter :get_obj

  def for
    respond_to do |format|
      if current_user.vote_exclusively_for(@obj)
        @vote_for =  @obj.votes_for
        @vote_against = @obj.votes_against
        format.json {render :json => {:vote_for => @vote_for, :vote_against => @vote_against}}
      else
      @vote_for =  @obj.votes_for
      @vote_against = @obj.votes_against
       format.json render :json => { :vote_for => @vote_for, :vote_against => @vote_against, notice: 'error!'}
      end
    end
  end

  def against
    respond_to do |format|
      if current_user.vote_exclusively_against(@obj)
        @vote_for =  @obj.votes_for
        @vote_against = @obj.votes_against
        format.json {render :json => {:vote_for => @vote_for, :vote_against => @vote_against}}
      else
       @vote_for =  @obj.votes_for
       @vote_against = @obj.votes_against
       format.json render :json => { :vote_for => @vote_for, :vote_against => @vote_against, notice: 'error!'}
      end
    end
  end


  private

  def get_obj
     @obj = params[:model_class].capitalize
     @obj = @obj.constantize.find(params[:id])
  end

end
