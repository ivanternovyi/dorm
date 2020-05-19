# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :max_tenants
      t.integer :floor
      t.integer :beds_count
      t.boolean :balcony, default: false
      t.boolean :fridge, default: false
      t.boolean :microwave, default: false

      t.timestamps
    end
  end
end
