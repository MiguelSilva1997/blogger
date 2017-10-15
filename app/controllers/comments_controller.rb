class CommentsController < ApplicationController
  def create
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.new(comment_params)
    #
    # @comment.save
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save


    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
