# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  mount_uploader :students_csv, StudentsCsvUploader
end
