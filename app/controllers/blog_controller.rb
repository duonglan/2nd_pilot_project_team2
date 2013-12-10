class BlogController < ApplicationController
  def home
    if signed_in?
      @activities = PublicActivity::Activity.order("created_at desc")
      @microposts = Micropost.all
      @micropost = current_user.microposts.build
      @user = @micropost.user
      @comments = @micropost.comments.build 
    end
 end
end