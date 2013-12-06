class ImagesController < ApplicationController
  before_action :signed_in_user, only: [:show, :new, :create]
  before_action :signed_in_user, only: [ :edit, :update]
  def index
    @image = Image.all
  end

  def create
    user = User.find(params[:user_id])
    binding.pry
    @image = user.images.build(image_params)

    if @image.save
    redirect_to user_image_path current_user, @image.id
    end
  end

  def show
    #@users = User.all
    #@user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end
  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to root_url
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end

end