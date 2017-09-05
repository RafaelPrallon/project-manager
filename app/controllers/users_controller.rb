class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
    @user_projects = @user.projects
  end
end
