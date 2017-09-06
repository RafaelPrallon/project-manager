class BugsController < ApplicationController
  before_action :set_project
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = @project.bugs.build(bug_params)
    if @bug.save
      messeger = SlackMesseger.new
      notifier = messeger.generate_notifier
      resumo = @bug.description.truncate(27, separator: ' ')
      byebug
      flash[:notice] = 'O bug foi reportado'
      message = "Um bug foi reportado no projeto #{@bug.project.name}. Descrição resumida do erro: #{resumo}"
      messeger.send_message(notifier, message)
      redirect_to project_bug_path(@project, @bug)
    else
      flash.now[:alert] = 'O bug não pode ser reportado'
      render 'new'
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(project_params)
      flash[:notice] = 'O bug foi atualizado com sucesso'
    else
      flash[:alert] = 'O bug não pode ser atualizado'
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    flash[:notice] = 'O bug foi deletado com sucesso'
    redirect_to project_bugs_path(@project)
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :status)
  end

  def set_project
    @project = Project.friendly.find(params[:project_id])
  end
end