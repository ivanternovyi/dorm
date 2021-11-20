# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  domain: 'enter-dorm.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

ActionMailer::Base.default from: 'EnterDorm <enterdorm@gmail.com>'
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
