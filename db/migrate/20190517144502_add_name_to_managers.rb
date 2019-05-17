class AddNameToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :first_name, :string
    add_column :managers, :last_name, :string
  end
end
