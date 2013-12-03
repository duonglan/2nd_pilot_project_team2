class BlogController < ApplicationController
  def home
    if signed_in?
      redirect_to user_microposts_path(current_user)
    else
      redirecto_to signin_path
    end
 
 end
end
