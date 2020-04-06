class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    
    @article = Article.find(params[:id])
  end

  def create
    #below just prints our the params straight to the page
    #render plain: params[:article]
    #we cant send the article directly into Article.new. There is an issue with security and so we need to send it as we have done below.
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
    flash[:notice] = "Article was updated successfully"
    redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end