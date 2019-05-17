module Filterable
  extend ActiveSupport::Concern

  included do
    default_scope { order(:created_at) }
    scope :by_keyword, ->(keyword) { by_first_name(keyword).or(by_last_name(keyword)).or(by_email(keyword)) }
    scope :by_first_name, ->(first_name) { where('first_name LIKE ?', "%#{first_name}%") }
    scope :by_last_name, ->(last_name) { where('last_name LIKE ?', "%#{last_name}%") }
    scope :by_email, ->(email) { where('email LIKE ?', "%#{email}%") }
  end
end
