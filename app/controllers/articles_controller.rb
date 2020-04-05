class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end
  def index
    @articles = Article.all
  end
  def new
    
  end

  def create
    #below just prints our the params straight to the page
    #render plain: params[:article]
    #we cant send the article directly into Article.new. There is an issue with security and so we need to send it as we have done below.
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    @article.save
    redirect_to article_path(@article)
  end
end