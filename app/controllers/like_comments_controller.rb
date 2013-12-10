class LikeCommentsController < ApplicationController
  def new
  end

  def new
    @like_comment = LikeComment.new
  end

  def index
    @like_comments = LikeComment.all
  end

  def create
    comment = Comment.find params[:micropost_id]
    like_comment = current_user.like_comments.build
    if like_comment.save
      redirect_to :back
    end
  end

  def show
  end

  def destroy
    LikeComment.find(params[:id]).destroy
    redirect_to :back
  end
end