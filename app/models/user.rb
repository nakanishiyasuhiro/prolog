class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :name, presence: true
  has_many :programminglogs
  has_many :likes
  has_many :liked_programminglogs, through: :likes, source: :programminglog
  def already_liked?(programminglog)
    self.likes.exists?(programminglog_id: programminglog.id)
  end
  has_many :sns_credentials
  mount_uploader :image, ImageUploader
end
