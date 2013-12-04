class BlogController < ApplicationController
  def home
    if signed_in?
      # @user = @micropost.user
      @microposts = Micropost.all
      @micropost = current_user.microposts.build
      @comments = @micropost.comments.build
    end
 
 end
end
