class LikeImagesController < ApplicationController
  before_action :signed_in_user

  def destroy
    LikeImage.find(params[:id]).destroy
    redirect_to :back
  end
end