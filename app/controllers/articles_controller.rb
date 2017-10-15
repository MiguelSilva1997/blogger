class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "You succesfully created #{@article.title}"
      redirect_to article.path(@article)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
