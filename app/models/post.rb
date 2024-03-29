# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :manager, foreign_key: :manager_id

  default_scope { order(:created_at) }
  scope :important, -> { where(important: true) }

  POSTS_PER_PAGE = 15

  self.per_page = POSTS_PER_PAGE
end
