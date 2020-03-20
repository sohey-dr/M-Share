class Share < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :music_name, presence: true, length: { maximum: 255 }
  validates :artist_name, presence: true, length: { maximum: 255 }
  mount_uploader :img, ImageUploader
end
