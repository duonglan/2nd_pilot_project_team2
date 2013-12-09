class GroupMicropostsController < ApplicationController
  before_action :signed_in_user

def index
    
  end

  def show
    @group = Group.find(params[:group_id])
    @group_micropost = GroupMicropost.find(params[:id])
  end

  def new
    #@group = Group.find(params[:group_id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @group_micropost = GroupMicropost.find(params[:id])
  end

  def create
    @group = Group.find(params[:group_id])
    @group_micropost = @group.group_microposts.build(group_micropost_params)
    @group_micropost.update_attributes(user_id: current_user.id)
    if @group_micropost.save
      flash[:success] = "Micropost created!" 
    else
      flash[:erro] = "Micropost blank!"
    end
    redirect_to :back
    
  end
  
  def update
    group = Group.find(params[:group_id])
    group_micropost = group.group_microposts.find(params[:id])
    if params[:group_micropost]
      if group_micropost.update_attributes(group_micropost_params)
        flash[:success] = "Post updated"
        redirect_to group_path group
      else
        flash[:error] = "failed"
      end
    else
      group_micropost.like_group_microposts.build(user_id: current_user.id)
      if group_micropost.save
        redirect_to :back
      end
    end
  end

  def destroy
    @group_micropost = GroupMicropost.find(params[:id])
    @group_micropost.destroy
    redirect_to :back
  end

  private

    def group_micropost_params
      params.require(:group_micropost).permit(:content)
    end

    def correct_user
      
    end
end