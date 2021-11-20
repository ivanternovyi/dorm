# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'enterdorm@gmail.com'
  layout 'mailer'
end
