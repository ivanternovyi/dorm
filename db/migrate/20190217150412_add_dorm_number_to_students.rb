class AddDormNumberToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :dorm_number, :integer
  end
end
