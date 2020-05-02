class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_dislikes, dependent: :destroy

  has_many :user_comments, through: :comments, source: :user
  has_many :user_favorites, through: :post_favorites, source: :user
  has_many :user_likes, through: :post_likes, source: :user
  has_many :user_dislikes, through: :post_dislikes, source: :user

  def rating
     self.post_likes.count - self.post_dislikes.count
  end
end
