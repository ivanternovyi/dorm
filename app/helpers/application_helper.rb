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

  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-error"
    when 'alert' then "alert alert-error"
    end
  end
end
