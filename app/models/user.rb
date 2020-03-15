class User < ApplicationRecord
  has_secure_password
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, presence: true, length: { maximum: 300 }
  
  mount_uploader :profile_img, ImageUploader
  mount_uploader :back_img, ImageUploader
end
