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
    @micropost = current_user.microposts.find(params[:comment][:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @micropost
    else
      @feed_items = []
      redirect_to @micropost
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
      params.require(:comment).permit(:name, :content, :micropost_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end
end
