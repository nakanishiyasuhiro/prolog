class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :programminglogs
  has_many :likes
  has_many :liked_programminglogs, through: :likes, source: :programminglog
  def already_liked?(programminglog)
    self.likes.exists?(programminglog_id: programminglog.id)
  end
  mount_uploader :image, ImageUploader
end