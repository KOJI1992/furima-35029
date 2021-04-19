class CommentsController < ApplicationController
  def new
    @comments = comment.all
    @comment = comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
