class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def render_422
    render file: 'public/422.html'
  end

  def authenticate_student
    authenticate_student! unless current_admin
  end

  def authenticate_manager
    authenticate_manager! unless current_admin
  end
end
