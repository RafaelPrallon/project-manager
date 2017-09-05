class UserProjectsController < ApplicationController
  before_action :set_user_project, only: [:show, :edit, :update, :destroy]
  def index
    @user_projects = UserProject.all
  end

  def show
  end

  def new
    @user_project = UserProject.new
  end

  def edit
  end

  def create
    @user_project = UserProject.new(user_project_params)
    respond_to do |format|
      if @user_project.save
        format.html {
          redirect_to project_path(@project),
                      notice: "#{@user_project.user.full_name} foi adicionado com sucesso."
        }
        format.json { render :show, status: :created, location: @user_project }
      else
        format.html { render :new }
        format.json { render json: @user_project.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @user_project.update(user_project_params)
        format.html { redirect_to @user_project, notice: 'A relação usuário projeto foi atualizada.' }
        format.json { render :show, status: :ok, location: @user_project }
      else
        format.html { render :edit }
        format.json { render json: @user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_project.destroy
    respond_to do |format|
      format.html { redirect_to user_path, notice: 'O usuário foi removido do projeto.' }
      format.json { head :no_content }
    end
  end
  private
  def set_user_project
    @user_project = UserProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_project_params
    params.require(:user_project).permit(:user_id, :project_id)
  end
end
