require 'csv'

class StudentsCsvService
  PUBLIC_FOLDER = '/public'.freeze
  attr_reader :admin

  def initialize(admin)
    @admin = admin
  end

  def call
    CSV.foreach(file_url, headers: true) do |row|
      Student.create(row.to_hash)
    end
  end

  private

  def file_url
    Rails.root.to_s + PUBLIC_FOLDER + admin.students_csv_url
  end
end
