class Programminglog < ApplicationRecord
  validates :title, :text, presence: true 
  belongs_to :user
  has_many :comments

  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

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

