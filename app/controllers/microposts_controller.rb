class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @user = User.find(params[:user_id])
    @microposts = Micropost.all
    @micropost = current_user.microposts.build
    @comments = @micropost.comments.build
  end

  def show
    @users = User.all
    @user = User.find(params[:user_id])
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build
  end

  def new
    @micropost = current_user.microposts.build
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.update_attributes(friend_id: @user.id)
    if @micropost.save
      flash[:success] = "Status created!"
      redirect_to :back
    else
      flash[:erro] = "Status blank!"
      redirect_to user_microposts_path current_user
    end
  end

  def update
    micropost = Micropost.find(params[:id])
    if params[:micropost]
      if @micropost.update_attributes(micropost_params)
        flash[:success] = "Micropost updated"
        redirect_to user_micropost_path current_user, @micropost
      else
        flash[:erro] = "Micropost didn't updated"
      end
    else
      micropost.like_microposts.build(user_id: current_user.id)
      if micropost.save
        redirect_to :back
      end
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :status)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end