class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

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
    @micropost = @user.microposts.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.update_attributes(user_id: current_user.id)
    if @micropost.save
      flash[:success] = "Entry created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'blog/home'
    end
    
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def comment_params
      params.require(:comment).permit(:content)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
end
