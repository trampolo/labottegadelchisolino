class Page < ActiveRecord::Base
  
    has_attached_file :photo, 
                      :storage => :database, 
                      :database_table => 'photos',
                      :styles => { :original => ["150x", :png] }
end
