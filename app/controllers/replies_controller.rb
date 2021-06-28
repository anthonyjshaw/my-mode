class RepliesController < ApplicationController

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.comment
    if @reply.save
      redirect_to style_path(@reply.comment.style)
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
