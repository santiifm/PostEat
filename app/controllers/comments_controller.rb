class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.author = current_user.email
    @comment.save

    redirect_to article_path(@comment.article)
  end

  def destroy
    if current_user.email != @comment.author
      render  "articles/show"
    else
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to article_url, notice: "El comentario fue eliminado exitosamente." }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end
