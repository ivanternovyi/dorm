# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Errorable

  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def authenticate_student
    authenticate_student! unless current_admin
  end

  def authenticate_manager
    authenticate_manager! unless current_admin
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  class << self
    def default_url_options(options = {})
      options.merge({ locale: I18n.locale })
    end
  end
end
