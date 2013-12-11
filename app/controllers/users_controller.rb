class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show,]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @search = Search.new User, params[:search]
    @search.order = "name"
    @users = @search.run.paginate(page: params[:page], per_page: 3)
  end

  def show
  	@user = User.find params[:id]
    @microposts = Micropost.all.paginate page: params[:page]
    @micropost = current_user.microposts.build
    @comments = @micropost.comments.build
    if params[:micropost] || params[:comment]
      redirect_to :back
    end
  end

  def new
  	@user = User.new
  end

  def edit
  	# @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
    @user.birthday = params[:user][:birthday]
    @user.sex = params[:user][:sex]
    @user.phone_number = params[:user][:phone_number]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Facebook!"
      redirect_to @user
    else
      render 'new'
    end
  end

 private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :avatar, :cover)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find params[:id]
      redirect_to root_url unless current_user? @user
    end
end