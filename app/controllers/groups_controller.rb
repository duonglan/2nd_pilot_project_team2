class GroupsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  	@groups = Group.paginate(page: params[:page], per_page: 3)
  end

 def show
    @group = Group.find(params[:id])
    @members =  @group.members.paginate(page: params[:page], per_page: 3)
  end

  def new
  	@group = current_user.groups.build if signed_in?
  end


  def create
  	group = current_user.groups.build(group_params)
  	if group.save
  		member = group.members.build(user_id: current_user.id);
  		#before { @micropost = user.microposts.build(user_id: current_user.id) }
  		member.save
      flash[:success] = "New group created!"
      redirect_to current_user
    else
     # flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end
end
