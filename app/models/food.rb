class Food < ActiveRecord::Base
  belongs_to :food_type
  
  has_attached_file :photo, 
                    :storage => :database, 
                    :database_table => 'photos',
                    :styles => { :thumb => ["120x", :png] }
  
  default_scope select_without_file_columns_for(:photo)
  
end
