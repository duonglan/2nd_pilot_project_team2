class GroupCommentsController < ApplicationController
before_action :signed_in_user

  def new
    @group_comment = GroupComment.new
  end

  def edit
    group = Group.find params[:group_id]
    group_micropost = GroupMicropost.find params[:group_micropost_id]
    group_comment = GroupComment.find params[:id]
  end

  def update
    group_micropost = GroupMicropost.find params[:group_micropost_id]
    group_comment = group_micropost.group_comments.find params[:id]
    if params[:group_comment]
      if group_comment.update_attributes group_comment_params
        redirect_to :back
      end
    elsif params[:like] == "like_group_comment" 
      group_comment.like_group_comments.build user_id: current_user.id
      if group_comment.save
        redirect_to :back
      else
        flash[:error] = "Error!"
      end
    end
  end

  def create
    @group = Group.find params[:group_id]
    @group_micropost = GroupMicropost.find params[:group_micropost_id]
    @group_comment = @group_micropost.group_comments.build group_comment_params
    @group_comment.update_attributes user_id: current_user.id, group_id: @group.id
    unless @group_comment.save
      flash[:error] = "Blank!"
    end
    redirect_to :back
  end

  def destroy
    group_comment = GroupComment.find params[:id]
    group_comment.destroy
    redirect_to :back
  end

  def index
    group_comments = GroupComment.all
  end

  private
  def group_comment_params
    params.require(:group_comment).permit(:content)
  end
end