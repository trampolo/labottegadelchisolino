namespace :db do
  desc "Popola il db con dati di esempio"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_food_type
    make_pages
    make_food_example
    make_users
  end
  
 
end

def make_food_type
  desc "Creating FoodTypes..."
  FoodType.create!(:name => "Antipasti")
  FoodType.create!(:name => "Primi")
  FoodType.create!(:name => "Secondi")
  FoodType.create!(:name => "Pizze")
  FoodType.create!(:name => "Chisolini")
  FoodType.create!(:name => "Dolci")
end

def make_food_example
  desc "Creating foods..."
  Food.create!(:name => "Chisolino con salumi", 
               :content => "chisolino con salumi (salame, pancetta, etc.)", 
               :price => 7.5, 
               :food_type_id => 5,
               :important => 't')
  Food.create!(:name => "Pizza Margherita", 
               :content => "pomodoro, mozzarella", 
               :price => 4.5, 
               :food_type_id => 4,
               :important => 'f')
  Food.create!(:name => "Pizza 4 Stagioni", 
               :content => "pomodoro, mozzarella, e roba varia", 
               :price => 4.5, 
               :food_type_id => 4,
               :important => 't')
  Food.create!(:name => "Calzone", 
               :content => "pomodoro, mozzarella, prosciutto", 
               :price => 4.5, 
               :food_type_id => 4,
               :important => 't')

end

def make_pages
  desc "Creating Pages..."
  Page.create!(:content => "<h1>Benvenuti alla bottega!</h1><p><strong>Da modificare</strong><br />        eripuit probatus id usu, nec ea dos epicuri verterem, quando tempr et mei. Eam equidem erroribus an, id nam illum persecuti")
  Page.create!(:content => "<strong>Da modificare</strong> menu del giorno, per agiungere i piatti alla lista seguente settare il piatto come importante")
  Page.create!(:content => "<strong>da modificare</strong> testo chi siamo ")
  Page.create!(:content => "<strong>da modificare</strong> testo dove siamo")
  Page.create!(:content => "<strong>da modificare</strong> testo contatti")
  Page.create!(:content => "<strong>da modificare</strong> testo news")
end

def make_users
  desc "Creating users..."
  User.create!(:username => "admin", :email => "rrotta@gmail.com", 
               :password => "gengiskan02", :password_confirmation => "gengiskan02")
               
end