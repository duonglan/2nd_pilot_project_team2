class CommentsController < ApplicationController
  before_action :signed_in_user

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build( comment_params )
    @comment.update_attributes(user_id: current_user.id)
    if @micropost.save
      flash[:success] = "comment created!"
      redirect_to :back
    else
      redirect_to user_micropost_path current_user, @micropost
      flash[:erro] = "comment blank!"
    end
    
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
