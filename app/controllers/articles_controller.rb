class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  # GET /articles/new
  def new
    if !current_user
      render :show
    else
      @article = Article.new
    end
  end

  # GET /articles/1/edit
  def edit
    if current_user.email != @article.created_by
      render  "articles/show"
    end
    create_log
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        create_log
        format.html { redirect_to article_url(@article), notice: "El artículo fué creado exitosamente" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "El artículo fué actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    if current_user.email != @article.created_by
      render  "articles/show"
    else
      create_log
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "El artículo fue eliminado exitosamente." }
        format.json { head :no_content }
      end
    end
  end

  def create_log
    @article.logs.create(user_id: current_user.id, action: action_name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :type, :body, :created_by, :photo)
    end
end
