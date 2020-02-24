class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :likes,dependent: :destroy
  has_many :liked_posts, through: :likes
  validates :name, presence: true
  def already_liked?(message)
    self.likes.exists?(message_id: message.id)
  end
end
