class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.style = Style.find(params[:style_id])
    if @comment.save
      redirect_to style_path(@comment.style)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
