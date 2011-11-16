class AddDescriptionToFood < ActiveRecord::Migration
  def change
    add_column :foods, :description, :text
  end
end
