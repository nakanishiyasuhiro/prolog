class Programminglog < ApplicationRecord
  validates :title, :text, presence: true 
  belongs_to :user

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

