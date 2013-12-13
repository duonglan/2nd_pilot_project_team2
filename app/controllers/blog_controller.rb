class BlogController < ApplicationController
  def home
    if signed_in?
      @microposts = Micropost.paginate page: params[:page], per_page: 20
      @micropost = current_user.microposts.new
      @user = @micropost.user
      @comments = @micropost.comments.new
    end
  end
end