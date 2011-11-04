namespace :db do
  desc "Popola il db con dati di esempio"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_food_type
    make_pages
  end
  
 
end

def make_food_type
  desc "Creating FoodTypes..."
  FoodType.create!(:name => "Antipasto")
  FoodType.create!(:name => "Primo")
  FoodType.create!(:name => "Secondo")
  FoodType.create!(:name => "Pizza")
  FoodType.create!(:name => "Chisolino")
  FoodType.create!(:name => "Dolce")
end

def make_pages
  desc "Creating Pages..."
  Page.create!(:content => "pagina 1")
  Page.create!(:content => "pagina 2")
  Page.create!(:content => "pagina 3")
  Page.create!(:content => "pagina 4")
  Page.create!(:content => "pagina 5")
  Page.create!(:content => "pagina 6")
end
