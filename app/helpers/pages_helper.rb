module PagesHelper
  
  def separator_tag
    img = image_tag "spacer.gif", :width => "239", :height => "1", :class => "float"
    content_tag :div, img, :class => "line"
  end
  
  def arrow_img
    image_tag "arrow.gif", :width => "8", :height => "7"
  end
end
