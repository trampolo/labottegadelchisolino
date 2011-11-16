class CreatePhotoTable < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :style
      t.integer :food_id
      t.timestamps
    end
    execute 'ALTER TABLE photos ADD COLUMN file_contents LONGBLOB'
  end

  def down
    drop_table :photos
  end
end
