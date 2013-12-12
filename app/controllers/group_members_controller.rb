class GroupMembersController < ApplicationController
  before_action :signed_in_user

  def create
    if params[:group_member]
  	  @group = Group.find params[:group_member][:group_id]
      @group.join! current_user
    elsif params[:user_id]
      user = User.find params[:user_id]
      group = Group.find params[:group_id]
      group.join! user if user && group
    end
  	redirect_to :back
  end

  def destroy
  	@group_member = GroupMember.find params[:id]
  	@group = Group.find @group_member.group_id
  	@group_member.destroy
  	redirect_to :back
  end
end