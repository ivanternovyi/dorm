# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def deny_view_student?(admin)
    @user&.id != @record.id && !admin
  end

  def show_claim_room_button
    @user.is_a?(Student) && @user.room != @record && @record.available_for_tenants?
  end

  def show_claims_button
    @user.is_a?(Manager) || @user.is_a?(Admin)
  end

  def show_edit_room_button
    @user.is_a?(Manager) || @user.is_a?(Admin)
  end
end
