class ArticlesController < ApplicationController
  def index
    @articles = ( articles = Article.published.order('published_at DESC') ).to_a
    @featured = @articles.delete articles.featured.first
  end

  def show
    @article = Article.published.find_by_slug(params[:slug])
  end
end