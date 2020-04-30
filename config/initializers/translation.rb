# frozen_string_literal: true

# All translations from config/locales/*.yml are auto loaded.
Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]

Rails.application.config.i18n.available_locales = %i[en ua]

Rails.application.config.i18n.default_locale = :en

Rails.application.config.locale_codes_mapping = { en: 'en', ua: 'ua' }
