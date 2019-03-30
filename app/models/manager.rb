class Manager < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  mount_uploader :avatar, AvatarUploader
end
