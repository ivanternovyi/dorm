class NotificationsMailer < ApplicationMailer
  def notify(email, subject, body)
    @student = Student.find_by(email: email)
    @body = body
    @subject = subject
    mail(to: @student.email, subject: @subject)
  end
end
