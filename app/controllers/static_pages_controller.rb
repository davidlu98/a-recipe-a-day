class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      #@tag = query.fetch(:tags, 'all')
      #@recipes, @errors = Spoonacular::Recipe.random(query)
    end
  end

  def upload
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  private
  def query
    params.fetch(:query, {})
  end

end
