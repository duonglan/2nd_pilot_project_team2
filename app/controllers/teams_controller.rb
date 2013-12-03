class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
  	@teams = Team.paginate(page: params[:page], per_page: 3)
  end
 def show
    @team = Team.find(params[:id])
    @members =  @team.members.paginate(page: params[:page], per_page: 3)

   # @teams = @user.teams.paginate(page: params[:page])
  end
  def new
  	@team = current_user.teams.build if signed_in?
  end


  def create
  	team = current_user.teams.build(team_params)
  	if team.save
  		member = team.members.build(user_id: current_user.id);
  		#before { @micropost = user.microposts.build(user_id: current_user.id) }
  		member.save
      flash[:success] = "New Team created!"
      redirect_to current_user
    else
     # flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  private

    def team_params
      params.require(:team).permit(:name)
    end
end
