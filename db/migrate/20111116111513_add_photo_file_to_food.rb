class AddPhotoFileToFood < ActiveRecord::Migration
  def change
    execute 'ALTER TABLE foods ADD COLUMN photo_thumb_file LONGBLOB'
  end
end
