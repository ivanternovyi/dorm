# frozen_string_literal: true

class AddNameFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
  end
end
