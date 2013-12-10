class LikeImageCommentsController < ApplicationController
  before_action :signed_in_user

  def destroy
    LikeImageComment.find(params[:id]).destroy
    redirect_to :back
  end
end