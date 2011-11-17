class AddPhotoFileToFood < ActiveRecord::Migration
  def change
    add_column :foods, :photo_thumb_file, :binary
  end
end
