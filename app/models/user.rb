class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  has_many :post_favorites, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_dislikes, dependent: :destroy

  has_many :comment_favorites, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :comment_dislikes, dependent: :destroy

  has_many :reply_favorites, dependent: :destroy
  has_many :reply_likes, dependent: :destroy
  has_many :reply_dislikes, dependent: :destroy

  has_many :favorited_posts, through: :post_favorites, source: :post
  has_many :liked_posts, through: :post_likes, source: :post
  has_many :disliked_posts, through: :post_dislikes, source: :post

  has_many :favorited_comments, through: :comment_favorites, source: :comment
  has_many :liked_comments, through: :comment_likes, source: :comment
  has_many :disliked_comments, through: :comment_dislikes, source: :comment

  has_many :favorited_replies, through: :reply_favorites, source: :reply
  has_many :liked_replies, through: :reply_likes, source: :reply
  has_many :disliked_replies, through: :reply_dislikes, source: :reply



end
