class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @completes = @user.completes
    @joined = @user.joinups
    @likes = Todo.joins(:likes).where(['likes.user_id = ?', @user.id])
  end

end
