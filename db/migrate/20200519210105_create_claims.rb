# frozen_string_literal: true

class CreateClaims < ActiveRecord::Migration[6.0]
  def change
    create_table :claims do |t|
      t.boolean :priority, default: false
      t.datetime :expires_at
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
