# frozen_string_literal: true

class AddAvatarToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :avatar, :string
  end
end
