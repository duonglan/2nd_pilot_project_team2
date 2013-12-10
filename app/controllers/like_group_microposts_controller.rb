class LikeGroupMicropostsController < ApplicationController
  def new
    @like_group_micropost = LikeGroupMicropost.new
  end

  def index
    @like_group_microposts = LikeGroupMicropost.all
  end

  def create
    group_micropost = GroupMicropost.find params[:group_micropost_id]
    like_group_micropost = current_user.like_group_microposts.build()
    if like_group_micropost.save
      redirect_to :back
    end
  end

  def show    
  end

  def destroy
    LikeGroupMicropost.find(params[:id]).destroy
    redirect_to :back
  end
end