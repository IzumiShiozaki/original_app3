class Article < ApplicationRecord
  belongs_to :user
  has_many :good, dependent: :destroy
  has_many :gooders, through: :good, source: :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence:true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence:true, length: {maximum:1000}
  validate :picture_size
  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
