class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @article  = current_user.articles.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def japanese
  end

  def socialstudies
  end

  def math
  end

  def science
  end

  def english
  end
end
