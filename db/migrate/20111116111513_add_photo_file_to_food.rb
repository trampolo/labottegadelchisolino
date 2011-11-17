class AddPhotoFileToFood < ActiveRecord::Migration
  def change
    add_column :fOods, :photo_thumb_file, :binary
  end
end
