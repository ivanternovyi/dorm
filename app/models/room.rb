# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :claim_rooms
  has_many :claims, through: :claim_rooms
  has_many :students

  validates :name, presence: true
  validates :max_tenants, numericality: { greater_than: 0 }, presence: true
  validates :beds_count, numericality: { greater_than: 0 }, presence: true
  validates :floor, numericality: { greater_than: 0 }, presence: true
end
