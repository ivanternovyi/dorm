# frozen_string_literal: true

class Student < ApplicationRecord
  include Filterable

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :room, optional: true
  has_one :claim, dependent: :destroy

  after_create :create_claim

  STUDENTS_PER_PAGE = 15

  self.per_page = STUDENTS_PER_PAGE

  def claim_for_room(room_id)
    claim_room = ClaimRoom.new(claim_id: claim.id, room_id: room_id)

    claim_room.save
  end

  private

  def create_claim
    Claim.create(student_id: id)
  end
end
