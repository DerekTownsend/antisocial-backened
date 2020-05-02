class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :replies, dependent: :destroy
  has_many :comment_favorites, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :comment_dislikes, dependent: :destroy

  has_many :user_replies, through: :replies, source: :user
  has_many :user_favorites, through: :comment_favorites, source: :user
  has_many :user_likes, through: :comment_likes, source: :user
  has_many :user_dislikes, through: :comment_dislikes, source: :user

  def rating
     self.comment_likes.count - self.comment_dislikes.count
  end
end
