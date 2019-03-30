module ApplicationHelper
  def current_user
    current_admin || current_student || current_manager
  end
end
