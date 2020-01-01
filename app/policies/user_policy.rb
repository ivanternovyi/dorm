class UserPolicy < ApplicationPolicy
  def deny_view_student?(admin)
    @user&.id != @record.id && !admin
  end
end
