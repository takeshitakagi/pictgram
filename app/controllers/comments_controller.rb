class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    p params
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.topic = Topic.find(params[:topic_id])
    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
#    logger.debug @item.errors.full_messages
  end

  def edit
    @comment = Comment.find(params[:description])
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
