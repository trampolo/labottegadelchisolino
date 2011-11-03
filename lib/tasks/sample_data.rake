namespace :db do
  desc "Popola il db con dati di esempio"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_food_type
  end
  
 
end

def make_users
  desc "Creating FoodTypes..."
  FoodType.create!(:name => "Antipasto")
  FoodType.create!(:name => "Primo")
  FoodType.create!(:name => "Secondo")
  FoodType.create!(:name => "Pizza")
  FoodType.create!(:name => "Chisolino")
  FoodType.create!(:name => "Dolce")
end

