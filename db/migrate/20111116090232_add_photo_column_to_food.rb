class AddPhotoColumnToFood < ActiveRecord::Migration
  def change
    add_column :foods, :photo_file_name, :string
    add_column :foods, :photo_content_type, :string
    add_column :foods, :photo_file_size, :integer
    add_column :foods, :photo_updated_at, :datetime
    add_column :foods, :photo_file, :binary
  end
end
