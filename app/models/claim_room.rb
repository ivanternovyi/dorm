class ClaimRoom < ApplicationRecord
  ALLOWED_STATUSES = %w[new in_progress approved rejected].freeze

  belongs_to :claim
  belongs_to :room

  validates :status, inclusion: { in: ALLOWED_STATUSES }
end
