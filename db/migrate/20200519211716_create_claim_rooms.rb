# frozen_string_literal: true

class CreateClaimRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :claim_rooms do |t|
      t.string :status, default: 'new'
      t.references :claim, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
