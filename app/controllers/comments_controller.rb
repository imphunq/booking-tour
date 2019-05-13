class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.create comment_params
    respond_to do |format|
      if @comment.save
        format.html {redirect_to location_path(@comment.location_id), notice: "Comment success"}
        format.js {}
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to location_path, notice: "Order was succsessfully destroyed"}
      format.json {head :no_content}
      format.js {render layout: false}
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :location_id, :user_id
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged_in to comment"
      redirect_to login_path
    end
  end
end
