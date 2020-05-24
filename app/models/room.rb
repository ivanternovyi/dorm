# frozen_string_literal: true

class Room < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :claim_rooms
  has_many :claims, through: :claim_rooms
  has_many :students

  validates :name, presence: true
  validates :max_tenants, numericality: { greater_than: 0 }, presence: true
  validates :beds_count, numericality: { greater_than: 0 }, presence: true
  validates :floor, numericality: { greater_than: 0 }, presence: true

  scope :available, -> {
    joins(:students).group(:id, :room_id)
      .having('COUNT(students.room_id) < rooms.max_tenants')
      .order(created_at: :asc)
  }

  ROOMS_PER_PAGE = 15.freeze

  self.per_page = ROOMS_PER_PAGE

  def students_living_count
    students.size
  end
end
