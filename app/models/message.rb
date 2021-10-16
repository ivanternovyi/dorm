# frozen_string_literal: true

class Message < ApplicationRecord
  default_scope { order(:created_at) }
  scope :reachable, -> { limit(500) }

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
