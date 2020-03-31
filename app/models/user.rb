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
  
  has_many :comments, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favos, through: :favorites, source: :share, dependent: :destroy
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def favorite(other_share)
    self.favorites.find_or_create_by(share_id: other_share.id)
  end
  
  def unfavorite(other_share)
    favorite = self.favorites.find_by(share_id: other_share.id)
    favorite.destroy if favorite
  end
  
  def favorite?(other_share)
    self.favos.include?(other_share)
  end
  
  def feed_shares
    Share.where(user_id: self.following_ids + [self.id])
  end
  
end
