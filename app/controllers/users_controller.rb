class UsersController < ApplicationController
  before_action :logged_in_user, only: [:update, :destroy]
  def show
    @user = User.find(params[:id])
    @articles = @user.article.paginate(page: params[:page])   # 投稿記事一覧用変数
    @article = current_user.article.build if logged_in?       # 記事投稿用の空インスタンス変数
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ、Ideas for Classへ!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

     # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  end