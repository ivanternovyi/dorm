# frozen_string_literal: true

class DeviseCreateManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :managers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :managers, :email,                unique: true
    add_index :managers, :reset_password_token, unique: true
  end
end
