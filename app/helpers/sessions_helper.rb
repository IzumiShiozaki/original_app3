module SessionsHelper

    # 渡されたユーザーでログインする
    def log_in(user)
      session[:user_id] = user.id
    end
  
    # 渡されたユーザーがログイン済みユーザーであればtrueを返す
    def current_user?(user)
      user == current_user
    end


    # 現在ログイン中のユーザーを返す (いる場合)
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end

     # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end

      # 現在のユーザーをログアウトする
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

      # 元のURLへ戻る
    def redirect_before_url(default = root_path)
      return session[:before_forwarding_url] || default
      session.delete(:before_forwarding_url)
    end

    # 現在のURLを覚えておく    
    def before_location(current_url)
      session[:before_forwarding_url] = current_url
    end
end