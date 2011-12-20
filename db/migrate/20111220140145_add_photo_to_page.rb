class AddPhotoToPage < ActiveRecord::Migration
  def change
    add_column :pages, :photo_file_name, :string
    add_column :pages, :photo_content_type, :string
    add_column :pages, :photo_file_size, :integer
    add_column :pages, :photo_updated_at, :datetime
    add_column :pages, :photo_file, :binary
  end
end
