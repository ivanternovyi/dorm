class AddStudentsCsvToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :students_csv, :string
  end
end
