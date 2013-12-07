class AlbumsController < ApplicationController
  before_action :signed_in_user

  def index
    @albums = Album.paginate(page: params[:page], per_page: 10)
  end
  def show
    album = Album.find(params[:id])
    @image = album.images
  end

  def new
    @album = current_user.albums.build if signed_in?
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      flash[:success] = "Album created!"
      redirect_to user_albums_path current_user
    else
      render user_album_path current_user, @album
    end
  end

  def destroy
  end

  private

    def album_params
      params.require(:album).permit(:name)
    end
end
