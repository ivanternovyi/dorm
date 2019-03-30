module ApplicationHelper
  def current_user
    current_admin || current_student || current_manager
  end

  def current_user_path
    if current_user.is_a? Admin
      admins_path
    elsif current_user.is_a? Manager
      manager_path(current_user)
    else
      student_path(current_user)
    end
  end
end
