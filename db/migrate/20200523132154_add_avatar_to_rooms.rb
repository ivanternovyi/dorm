# frozen_string_literal: true

class AddAvatarToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :avatar, :string
  end
end
