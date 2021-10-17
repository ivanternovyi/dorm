# frozen_string_literal: true

class AddAvatarToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :avatar, :string
  end
end
