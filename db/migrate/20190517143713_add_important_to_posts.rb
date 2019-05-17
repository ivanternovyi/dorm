class AddImportantToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :important, :boolean, default: 'false'
  end
end
