class CreatePhotoTable < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :style
      t.integer :food_id
      t.binary :file_contents
      t.timestamps
    end
  end

  def down
    drop_table :photos
  end
end
