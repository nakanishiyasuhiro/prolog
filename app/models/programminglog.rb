class Programminglog < ApplicationRecord
  validates :title, :text, presence: true 
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search
      Programminglog.where('text LIKE(?) OR title LIKE(?) ', "%#{search}%", "%#{search}%")
    else 
      Programminglog.all
    end
  end

  mount_uploader :image, ImageUploader

  acts_as_taggable
end

