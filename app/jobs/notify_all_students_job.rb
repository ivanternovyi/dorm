# frozen_string_literal: true

class NotifyAllStudentsJob < ActiveJob::Base
  queue_as :mailers

  def perform(subject, body)
    Student.select(:email).find_each do |student_email|
      NotifyStudentJob.perform_later(
        student_email,
        notification_params[:subject],
        notification_params[:body]
      )
    end
  end
end