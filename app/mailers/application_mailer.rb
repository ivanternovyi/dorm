# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@enterdorm.com'
  layout 'mailer'
end
