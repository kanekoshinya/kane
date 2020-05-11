class Group < ApplicationRecord
  validates :name,presence: true,uniqueness: true
  belongs_to :category
  has_many :messages

  has_many :favorites
  has_many :favorited_users, through: :favorites
end
