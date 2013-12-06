class ImagesController < ApplicationController
  before_action :signed_in_user
  def index
    @image = Image.all
  end
  def new
    album = Album.find(params[:id])
    @image = album.images.build
  end

  def create
    album = Album.find(params[:album_id])
    @image = album.images.build(image_params)
    @image.update_attributes(user_id: current_user.id)
    if @image.save
    redirect_to user_album_path current_user, album.id
    end
  end

  def show
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