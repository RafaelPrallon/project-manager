class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    if @bug.save
      flash[:success] = "O bug foi repostado"
      redirect_to bug_path(@bug)
    else
      flash[:warning] = "O bug não pode ser reportado"
      render 'new'
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
      flash[:success] = "O bug foi atualizado com sucesso"
    else
      flash[:warning] = 'O bug não pode ser atualizado'
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.solved = true
  end
end