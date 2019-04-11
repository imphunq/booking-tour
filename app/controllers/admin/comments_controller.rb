module Admin
  class CommentsController < AdminBaseController
    def index
      @comments = Comment.select_col.page(params[:page]).per Settings.paginate_perpage
    end

    def destroy
      @comment = Comment.find_by id: params[:id]
      if @comment.destroy
        flash[:success] = t "admin.destroy.delete_succ"
      else
        flash[:danger] = t "admin.destroy.delete_fail"
      end
      redirect_to admin_comments_path
    end

    private
    def count_number index, page
      per_page = Settings.paginate_perpage
      count = (page-1)*per_page + index
    end
    helper_method :count_number
  end
end
