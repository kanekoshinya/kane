class Message < ApplicationRecord
  validates :content,presence: true

  belongs_to :user
  belongs_to :group
  has_many :likes
  has_many :liked_users, through: :likes
end
