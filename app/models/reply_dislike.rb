class ReplyDislike < ApplicationRecord
  belongs_to :reply
  belongs_to :user
end
