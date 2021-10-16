# frozen_string_literal: true

class Claim < ApplicationRecord
  belongs_to :student
  has_many :claim_rooms
  has_many :rooms, through: :claim_rooms

  validate :belongs_to_one_student, on: :create

  private

  def belongs_to_one_student
    return if Claim.where(student_id: student_id).none?

    errors.add(:student_id, 'Already exist')
  end
end
