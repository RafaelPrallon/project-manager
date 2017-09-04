class UsersController < ApplicationController
  def my_projects
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
