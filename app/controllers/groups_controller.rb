class GroupsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :show, :update]

  def index
  	@groups = Group.paginate(page: params[:page], per_page: 5)
  end

 def show
    @group = Group.find(params[:id])
    @members =  @group.members.paginate(page: params[:page], per_page:10)
    @group_micropost = @group.group_microposts.build
    @group_microposts = @group.group_microposts
      .paginate(page: params[:page], per_page: 10)
    @group_comment = @group_micropost.group_comments.build
    @group_comments = @group_micropost.group_comments
  end

  def new
  	@group = current_user.groups.build if signed_in?
  end

  def create
  	group = current_user.groups.build(group_params)
  	if group.save
  		member = group.members.build(user_id: current_user.id)
  		member.save
      flash[:success] = "New group created!"
      redirect_to group_path group
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end
end