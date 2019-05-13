class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @article = current_user.article.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def subject
    if logged_in?
      if params[:search]
        @search = params[:search]
        @feed_items = Article.where('subject = ?', @search).paginate(page: params[:page])
        respond_to do |format|
          format.html { redirect_to subject_path }
          format.js
        end
      else
        @search = "すべての投稿"
        @feed_items = Article.all.paginate(page: params[:page])
      end
    end
  end
end
