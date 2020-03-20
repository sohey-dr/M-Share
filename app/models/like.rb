class Like < ApplicationRecord
  belongs_to :user
  
  validates :like_artist, presence: true, length: { maximum: 250 }
  
  mount_uploader :img, ImageUploader
end
