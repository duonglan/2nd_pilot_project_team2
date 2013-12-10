class ImagesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @image = Image.all
  end

  def new
    album = Album.find params[:id]
  end

  def create
    @album = Album.find params[:album_id]
    @image = @album.images.build image_params
    @image.update_attributes user_id: current_user.id
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
    @album = Album.find params[:album_id]
    @image = @album.images.find params[:id]
    @image_comment = @image.image_comments.new
  end

  def destroy
    album = Album.find params[:album_id]
    image = album.images.find params[:id]
    image.destroy
    redirect_to user_album_path current_user, album
  end

  def update
    image = Image.find params[:id]
    if params[:like] == "like_image"
      image.like_images.build user_id: current_user.id
      if image.save
        redirect_to :back
      else
        flash[:erro] = "Like fail!"
      end
    end
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end

end