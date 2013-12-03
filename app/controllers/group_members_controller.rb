class GroupMembersController < ApplicationController
  before_action :signed_in_user

  def create
  	@group = Group.find(params[:group_member][:group_id])
  	@group.join!(current_user)
  	redirect_to @group
   # @user = User.find(params[:relationship][:followed_id])
    #current_user.follow!(@user)
    #redirect_to @user
   # render 'index'
  end

  def destroy
  	@group_member = GroupMember.find(params[:id])
  	@group = Group.find(@group_member.group_id)
  	@group_member.destroy
  	redirect_to @group
  #  current_user.unfollow!(@user)
  #  redirect_to @user
 	# render 'index'
  end
end
