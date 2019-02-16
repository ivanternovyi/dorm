class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate_user
    authenticate_student! unless current_admin
  end
end
