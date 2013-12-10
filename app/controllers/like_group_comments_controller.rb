class LikeGroupCommentsController < ApplicationController
  def new
    @like_group_comment = LikeGroupComment.new
  end

  def index
    @like_group_comments = LikeGroupComment.all
  end

  def create
    group_comment = GroupComment.find params[:group_comment_id]
    like_group_comment = current_user.like_group_comments.build
    if like_group_comment.save
      redirect_to :back
    end
  end

  def show    
  end

  def destroy
    LikeGroupComment.find(params[:id]).destroy
    redirect_to :back
  end
end