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
    joins('LEFT OUTER JOIN students ON students.room_id = rooms.id')
      .group(:id, :room_id)
      .having('COUNT(students.room_id) < rooms.max_tenants')
      .order(created_at: :desc)
  }

  ROOMS_PER_PAGE = 15.freeze

  self.per_page = ROOMS_PER_PAGE

  def students_living_count
    students.size
  end

  def is_available_for_tenants?
    students.size < max_tenants
  end
end
