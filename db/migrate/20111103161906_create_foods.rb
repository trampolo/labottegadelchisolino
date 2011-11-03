class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :content
      t.decimal :price
      t.references :food_type

      t.timestamps
    end
    add_index :foods, :food_type_id
  end
end
