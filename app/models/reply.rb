class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  has_many :reply_favorites, dependent: :destroy
  has_many :reply_likes, dependent: :destroy
  has_many :reply_dislikes, dependent: :destroy

  has_many :user_favorites, through: :reply_favorites, source: :user
  has_many :user_likes, through: :reply_likes, source: :user
  has_many :user_dislikes, through: :reply_dislikes, source: :user

  def rating
     self.reply_likes.count - self.reply_dislikes.count
  end
end
