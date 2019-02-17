class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  STUDENTS_PER_PAGE = 15.freeze

  self.per_page = STUDENTS_PER_PAGE
end
