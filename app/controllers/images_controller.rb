class ImagesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @image = Image.all
  end

  def new
    album = Album.find(params[:id])
  end

  def create
    @album = Album.find(params[:album_id])
    @image = @album.images.build(image_params)
    @image.update_attributes(user_id: current_user.id)
    if @image.save
      flash[:success] = "Uploaded!"
      redirect_to :back
    else 
      flash[:error] = "Upload errro!"
      redirect_to :back
    end
  end

  def show
    @user = User.find params[:user_id]
    @album = Album.find(params[:album_id])
    @image = @album.images.find params[:id]
    @image_comment = @image.image_comments.new
  end

  def destroy
    album = Album.find(params[:album_id])
    image = album.images.find params[:id]
    image.destroy
    redirect_to user_album_path current_user, album
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end

end