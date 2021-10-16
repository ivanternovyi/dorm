# frozen_string_literal: true

module ApplicationHelper
  def current_user
    current_admin || current_student || current_manager
  end

  def current_user_path
    case current_user
    when Admin
      admins_path
    when Manager
      manager_path(current_user)
    else
      student_path(current_user)
    end
  end

  def destroy_user_session_path
    case current_user
    when Admin
      destroy_admin_session_path
    when Manager
      destroy_manager_session_path
    else
      destroy_student_session_path
    end
  end

  def flash_class(level)
    {
      'notice' => 'alert alert-info',
      'success' => 'alert alert-success',
      'error' => 'alert alert-error',
      'alert' => 'alert alert-error'
    }[level]
  end
end
