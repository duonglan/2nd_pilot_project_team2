class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @user = User.find params[:user_id]
    @micropost = Micropost.find params[:id]
  end

  def new
    @micropost = current_user.microposts.new
  end

  def edit
    @micropost = Micropost.find params[:id]
  end

  def create
    @user = User.find params[:user_id]
    @micropost = current_user.microposts.build micropost_params
    @micropost.update_attributes friend_id: @user.id
   if @micropost.save
      @micropost.create_activity :create, owner: current_user
      redirect_to :back
    else
      flash[:erro] = "Status blank!"
      redirect_to :back
    end
  end

  def update
    microposts = Micropost.find params[:id]
    if params[:micropost]
      if microposts.update_attributes micropost_params
        redirect_to :back
      else
        flash[:erro] = "Micropost didn't updated"
      end
    else
      if params[:share] == "share"
        micropost = current_user.microposts.build(content: microposts.content,
          friend_id: current_user.id, user_id: current_user.id)
        micropost.update_attributes status: true
        redirect_to :back
      else
        if params[:like] == "like_micropost"
          microposts.like_microposts.build user_id: current_user.id
          if microposts.save
            redirect_to :back
          end
        end
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
      @micropost = current_user.microposts.find_by id: params[:id]
      redirect_to root_url if @micropost.nil?
    end
end