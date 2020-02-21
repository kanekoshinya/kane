class Group < ApplicationRecord
  validates :name,presence: true
  belongs_to :category
  has_many :messages
end
