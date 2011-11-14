class FoodType < ActiveRecord::Base
  has_many :foods
  
  attr_accessor :selected
end
