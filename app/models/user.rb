class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contents, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_contents, through: :likes, source: :content
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  def already_liked?(content)
    self.likes.exists?(content_id: content.id)
  end
end
