class BlogController < ApplicationController
  def home
    if signed_in?
      @microposts = Micropost.all
      @micropost = current_user.microposts.build
      @user = @micropost.user
      @comments = @micropost.comments.build
    end
 end
end
