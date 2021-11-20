# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: 'enter-dorm.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

ActionMailer::Base.default from: 'EnterDorm <info@enterdorm.com>'
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.delivery_method = if Rails.env.test?
                                       :test
                                     elsif Rails.env.development?
                                       :letter_opener
                                     else
                                       :smtp
                                     end

ActionMailer::Base.default_url_options = if Rails.env.test? || Rails.env.development?
                                           { host: 'localhost', port: 3000 }
                                         elsif Rails.env.production?
                                           { host: 'enter-dorm.herokuapp.com' }
                                         end

Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
