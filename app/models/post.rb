class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :manager

  scope :important, -> { where(important: true) }
end
