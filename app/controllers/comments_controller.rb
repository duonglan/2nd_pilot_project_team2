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
    micropost = Group.find(params[:micropost_id])
    comment = micropost.comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to :back
    else
      flash[:erro] = "Comment didn't updated"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build( comment_params )
    @comment.update_attributes(user_id: current_user.id)
    if @comment.save
      @comment.create_activity :create, owner: current_user
      flash[:success] = "comment created!"
      redirect_to :back
    else
      redirect_to user_micropost_path current_user, @micropost
      flash[:erro] = "comment blank!"
    end  
  end

  def update
    comment = Comment.find(params[:id])
    comment.like_comments.build(user_id: current_user.id)
      if comment.save
        redirect_to :back
      end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted!"
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
