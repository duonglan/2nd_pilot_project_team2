class AlbumsController < ApplicationController
  before_action :signed_in_user

  def index
    @user = User.find params[:user_id]
    @albums = @user.albums.paginate page: params[:page], per_page: 10
  end

  def show
    @album = Album.find params[:id]
    @image = Image.new
  end

  def new
    @album = current_user.albums.build if signed_in?
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash[:success] = "Album created!"
      redirect_to user_albums_path current_user
    else
      render user_album_path current_user, @album
    end
  end

  def destroy
    @album = Album.find params[:id]
    @album.destroy
    redirect_to user_albums_path current_user
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end