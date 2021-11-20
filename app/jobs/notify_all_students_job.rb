# frozen_string_literal: true

class NotifyAllStudentsJob < ActiveJob::Base
  queue_as :mailers

  def perform(subject, body)
    Student.select(:id, :email).find_each do |student|
      NotifyStudentJob.perform_later(
        student.email,
        subject,
        body
      )
    end
  end
end
