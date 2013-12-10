class BlogController < ApplicationController
  def home
    if signed_in?
<<<<<<< HEAD
=======
      @activities = PublicActivity::Activity.order("created_at desc")
>>>>>>> 9650d485c6259f6d6a52961f06f67b8ff0797118
      @microposts = Micropost.all
      @micropost = current_user.microposts.build
      @user = @micropost.user
      @comments = @micropost.comments.build
    end
 end
end
