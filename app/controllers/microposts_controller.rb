class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  # before_action :set_micropost,  only: [:show, :edit, :update, :destroy]

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.paginate(page: params[:page])
  end

  def new
    @micropost = current_user.microposts.build
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

   def create
      @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Entry created!"
      redirect_to user_micropost_path current_user, @micropost
    else
      @feed_items = []
      render 'blog/home'
    end
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Micropost updated"
      redirect_to user_micropost_path current_user, @micropost
    else
      render 'edit'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end