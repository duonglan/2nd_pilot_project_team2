class LikeMicropostsController < ApplicationController
  def new
    @like_micropost = LikeMicropost.new
  end

  def index
    @like_microposts = LikeMicropost.all
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    like_micropost = current_user.like_microposts.build()
    if like_micropost.save
      redirect_to :back
    end
  end

  def show    
  end

  def destroy
    LikeMicropost.find(params[:id]).destroy
    redirect_to :back
  end
end
