class Group < ApplicationRecord
  validates :name,presence: true
  belongs_to :category
end
