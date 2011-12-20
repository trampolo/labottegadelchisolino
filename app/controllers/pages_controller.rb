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
    @border_color = "#ffc000"
    @home_ht = ht
    @page = Page.find(1)
    
  end

  def premi
    @title = "Premi"
    @border_color = "#cc3333"
    @premi_ht = ht
    @page = Page.find(3)
  end

  def contact
    @title = "Contatti"
    @home_ht = ht
    @page = Page.find(5)
  end

  def where
    @title = "Dove siamo"
    @home_ht = ht
    @page = Page.find(4)
  end

  def links
    @title = "Link Utili"
    @home_ht = ht
    @page = Page.find(6)
  end
  
  def offerte
    @title = "Offerte"
    @border_color = "#3399ff"
    @offerte_ht = ht
    @page = Page.find(7)
  end
  
  def eventi
    @title = "Eventi"
    @border_color = "#663399"
    @eventi_ht = ht
    @page = Page.find(8)
  end
  
  def servizi
    @title = "Servizi"
    @border_color = "#663399"
    @servizi_ht = ht
    @page = Page.find(9)
  end

  def photos
    page = Page.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_data page.photo.file_contents(style), :type => page.photo_content_type    
  end
  
end
