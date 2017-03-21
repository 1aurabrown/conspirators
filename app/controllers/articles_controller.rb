class ArticlesController < ApplicationController
  def index
    @articles = ( articles = Article.published.order('published_at DESC') ).to_a
    @featured = @articles.delete articles.featured.first
    @nav_class = 'black'
  end

  def show
    @article = Article.published.find_by!(slug: params[:slug])
  end
end