class Share < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :music_name, presence: true, length: { maximum: 255 }
  validates :artist_name, presence: true, length: { maximum: 255 }
  mount_uploader :img, ImageUploader
  
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'share_id', dependent: :destroy
  has_many :favoes, through: :reverses_of_favorite, source: :user, dependent: :destroy
end