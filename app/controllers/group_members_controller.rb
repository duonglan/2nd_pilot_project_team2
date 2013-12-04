class GroupMembersController < ApplicationController
  before_action :signed_in_user

  def create
  	@group = Group.find(params[:group_member][:group_id])
  	@group.join!(current_user)
  	redirect_to @group
  end

  def destroy
  	@group_member = GroupMember.find(params[:id])
  	@group = Group.find(@group_member
      .group_id)
  	@group_member.destroy
  	redirect_to @group
  end
end