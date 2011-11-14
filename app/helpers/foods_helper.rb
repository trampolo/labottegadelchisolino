module FoodsHelper
  
  def food_type_selected_class(selected_id, id)
    "" if selected_id.nil?
    "selectedfoodtype" if id == selected_id.to_i
  end
    
end
