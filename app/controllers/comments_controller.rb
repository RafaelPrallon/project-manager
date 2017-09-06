class CommentsController < ApplicationController
  before_action :set_project, :set_bug

  def new
    @comment = Comment.new
  end

  def create
    unless current_user
      flash[:alert] = "Você precisa estar conectado para poder comentar"
      redirect_to new_user_session_path
    else
      @comment = @bug.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        messeger = SlackMesseger.new
        notifier = messeger.generate_notifier
        resumo = @comment.body.truncate(50, separator: ' ')
        flash[:notice] = 'O comentário foi adicionado'
        message = "Foi feito um comentário no bug #{@bug.title} do projeto #{@bug.project.name}. Resumo do comentário: #{resumo}"
        messeger.send_message(notifier, message)
        redirect_to project_bug_path(@project, @bug)
      else
        flash.now[:alert] = 'O comentário não pode ser adicionado'
        render 'new'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_project
    @project = Project.friendly.find(params[:project_id])
  end

  def set_bug
    @bug = Bug.find(params[:bug_id])
  end
end
