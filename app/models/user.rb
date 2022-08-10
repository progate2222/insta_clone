class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    mount_uploader :picture, ImageUploader
    validates :picture, presence: true
    has_secure_password
    validates :password, length: { minimum: 6 }
    has_many :feeds
    has_many :favorites, dependent: :destroy
    has_many :favorite_feeds, through: :favorites, source: :feed
end
