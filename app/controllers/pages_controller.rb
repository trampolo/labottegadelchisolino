class PagesController < ApplicationController
  before_filter :require_user, :only => :edit

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to root_url, notice: "La pagina e' stata aggiornata correttamente." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def home
    @title = "Home"
    @page1 = Page.find(1)
    @page2 = Page.find(2)
    @important_foods = Food.find_by_sql("SELECT * FROM FOODS WHERE important = 't'")
    rand_id = rand(Food.count)
    @important_foods_with_photo = Food.find_by_sql("SELECT * FROM FOODS WHERE photo_file_name 
      IS NOT NULL AND (description <> '' AND description IS NOT NULL) ORDER BY RANDOM() LIMIT 4 ")
  end

  def about
    @title = "Chi siamo"
    @page = Page.find(3)
  end

  def contact
    @title = "Contatti"
    @page = Page.find(5)
  end

  def where
    @title = "Dove siamo"
    @page = Page.find(4)
  end

  def news
    @title = "News"
    @page = Page.find(6)
  end
  
  def press
    @title = "Dicono Di Noi"
    @page = Page.find(7)
  end
end
