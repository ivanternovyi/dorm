# frozen_string_literal: true

class NotifyStudentJob < ActiveJob::Base
  queue_as :mailers

  def perform(email, subject, body)
    NotificationsMailer.notify(
      email,
      subject,
      body
    ).deliver_later
  end
end