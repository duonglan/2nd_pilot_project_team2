class FriendshipsController < ApplicationController
	before_action :signed_in_user, only: [:update, :create, :destroy]
  
  def index
  @user = User.find(params[:user_id])
  end

  def show
  redirect_to user_path current_user
  end

  def create
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
    @user = User.find current_user
    @friend = User.find params[:user_id]
    @friendship1 = Friendship.create(user_id: @user.id, friend_id: @friend.id, status: "requested")
    @friendship2 = Friendship.create(user_id: @friend.id, friend_id: @user.id, status: "pending")
    if @friendship1.save && @friendship2.save
      redirect_to :back
    else
      redirect_to user_path current_user
    end
  end

  def update
    @user = User.find current_user
    @friend = User.find params[:id]
    params[:friendship1] = {user_id: @user.id, friend_id: @friend.id, status: "accepted"}
    params[:friendship2] = {user_id: @friend.id, friend_id: @user.id, status: "accepted"}
    @friendship1 = Friendship.find_by_user_id_and_friend_id @user.id, @friend.id
    @friendship2 = Friendship.find_by_user_id_and_friend_id @friend.id, @user.id
    if @friendship1.update_attributes(friendship1) && @friendship2
        .update_attributes(friendship2)
      flash[:notice] = "Friend sucessfully accepted!"
      redirect_to user_friendships_path current_user
    else
      redirect_to user_path current_user
    end
  end

  def destroy
    @user = User.find params[:user_id]
    @friend = User.find params[:id]
    @friendship1 = @user.friendships.find_by_friend_id(params[:id]).destroy
    @friendship2 = @friend.friendships.find_by_user_id(params[:id]).destroy
    redirect_to user_friendships_path current_user
  end
  private
  def friendship1
      params.require(:friendship1).permit(:user_id, :friend_id, :status)
  end

  def friendship2
    params.require(:friendship2).permit(:friend_id, :user_id, :status)
  end
end