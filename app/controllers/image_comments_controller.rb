class ImageCommentsController < ApplicationController
before_action :signed_in_user

  def new
    @image_comment = ImageComment.new
  end

  def edit
    image = Image.find(params[:image_id])
    image_comment = ImageComment.find(params[:id])
  end

  def update
    @image_comment = ImageComment.find(params[:id])
    if @image_comment.update_attributes(image_comment_params)
      flash[:success] = "Comment updated"
      redirect_to :back
    else
      flash[:erro] = "Comment didn't updated"
    end
  end

  def create
    @album = Album.find params[:album_id]
    @image = Image.find params[:image_id]
    @image_comment = @image.image_comments.new(image_comment_params)
    @image_comment.update_attributes(user_id: current_user.id, album_id: @album.id)
    if @image_comment.save
      flash[:success] = "Comment!" 
    else
      flash[:error] = "Blank!"
    end
    redirect_to :back
  end

  def destroy
    image_comment = ImageComment.find(params[:id])
    image_comment.destroy
    redirect_to :back
  end

  def index
    image_comments = ImageComment.all
  end

  private
  def image_comment_params
    params.require(:image_comment).permit(:content)
  end
end