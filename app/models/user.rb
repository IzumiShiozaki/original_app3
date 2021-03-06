class User < ApplicationRecord
    has_many :article, dependent: :destroy
    has_many :good, dependent: :destroy
    has_many :gooding, through: :good, source: :article
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
  # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Article.where("user_id = ?", id)
  end

  # 投稿記事をいいねする
  def goodAdd(article)
    gooding << article
  end

  # いいねを解除する
  def unGood(article)
    Good.find_by(article_id: article.id).destroy
  end

  # 指定した記事を既にいいねしてたらtrueを返す
  def gooding?(article)
    gooding.include?(article)
  end
end