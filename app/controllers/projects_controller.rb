class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user
    if @project.save
      flash[:success] = "O projeto #{@project.name} foi criado com sucesso"
      redirect_to projects_path
    else
      flash[:warning] = 'O projeto não pode ser criado'
      render 'new'
    end
  end
  def show
    @project = Project.friendly.find(params[:id])
  end
  def edit
    @project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "O projeto #{@project.name} foi atualizado com sucesso"
    else
      flash[:warning] = 'O projeto não pode ser atualizado'
      render 'edit'
    end
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    UserProject.where(project: @project).each do |relationship|
      relationship.destroy
    end
    @project.destroy
    flash[:danger] = 'O projeto foi apagado com sucesso'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
