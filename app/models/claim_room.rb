# frozen_string_literal: true

class ClaimRoom < ApplicationRecord
  ALLOWED_STATUSES = %w[new in_progress approved rejected].freeze

  belongs_to :claim
  belongs_to :room

  validates :status, inclusion: { in: ALLOWED_STATUSES }
  validates :room_id, uniqueness: { scope: :claim_id }

  scope :new_claims, -> { where(status: 'new') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :approved, -> { where(status: 'approved') }
  scope :rejected, -> { where(status: 'rejected') }

  POSTS_PER_PAGE = 15

  self.per_page = POSTS_PER_PAGE

  def mark_in_progress!
    update(status: 'in_progress')
  end

  def approve!
    update(status: 'approved')

    claim.student.update(room_id: room.id)
  end

  def reject!
    update(status: 'rejected')
  end
end
