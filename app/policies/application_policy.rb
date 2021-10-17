# frozen_string_literal: true

class ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end
end
