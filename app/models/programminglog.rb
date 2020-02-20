class Programminglog < ApplicationRecord
  validates :title, :text, presence: true 
  belongs_to :user

  def self.search(search)
    return Programminglog.all unless search
    Programminglog.where('text LIKE(?)', "%#{search}%")
  end

  mount_uploader :image, ImageUploader
end
