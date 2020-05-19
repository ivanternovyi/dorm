class Student < ApplicationRecord
  include Filterable

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :claim, dependent: :destroy

  after_create :create_claim

  STUDENTS_PER_PAGE = 15.freeze

  self.per_page = STUDENTS_PER_PAGE

  private

  def create_claim
    Claim.create(student_id: id)
  end
end
