class PagesController < ApplicationController

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
