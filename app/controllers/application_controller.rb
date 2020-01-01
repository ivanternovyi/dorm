class ApplicationController < ActionController::Base
  include Errorable

  protect_from_forgery with: :exception

  protected

  def authenticate_student
    authenticate_student! unless current_admin
  end

  def authenticate_manager
    authenticate_manager! unless current_admin
  end
end
