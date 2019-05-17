class Manager < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  mount_uploader :avatar, AvatarUploader

  default_scope { order(:created_at) }

  MANAGER_PER_PAGE = 15.freeze

  self.per_page = MANAGER_PER_PAGE
end
