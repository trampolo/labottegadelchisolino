class AddColumnImportantToFood < ActiveRecord::Migration
  def change
    add_column :foods, :important, :boolean
  end
end
