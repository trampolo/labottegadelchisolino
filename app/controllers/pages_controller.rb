class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end

  def about
    @title = "Chi siamo"
  end

  def contact
    @title = "Contatti"
  end

  def where
    @title = "Dove siamo"
  end

  def news
    @title = "News"
  end
end
