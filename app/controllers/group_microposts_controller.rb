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
    
  end

  def destroy
    
  end

  private

    def group_micropost_params
      params.require(:group_micropost).permit(:content)
    end

    def correct_user
      
    end
end